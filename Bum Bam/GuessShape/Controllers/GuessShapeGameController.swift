//
//  GuessShapeGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeGameController: MainGameController, AKPickerViewDelegate ,PGuessShapeThumbViewDelegate {
    
    var gameModel: GuessShapeGameModel!
    var layoutAction: GuessShapeLayoutAction!
    var config: GuessShapeConfig!
    
    var settingsLayout: Layout!
    var settingsView: UIImageView!
    var selectShapeSetLayout: Layout!
    var shapeSetSelected: Bool = false
    /*var selectShapeSetView: AKPickerView!
    var selectDifficultyLayout: Layout!
    var startGameButtonView: UIButton!*/
    
    var gameLayout: Layout!
    
    var thumbLayouts: [Layout]!
    var siluetteLayout: Layout!
    var siluetteView: UIImageView!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! GuessShapeGameModel
        self.layoutAction = self.mainLayoutAction as! GuessShapeLayoutAction
        self.config = GuessShapeConfigInstance
    }
    
    override func didShowSettings() {
        self.layoutAction.didShowSettings()
        self.settingsLayout = self.layout["settings"]
        self.settingsView = self.settingsLayout.view as! UIImageView
        
        self.selectShapeSetLayout = self.settingsLayout["selectShapeSet"]
        for selectShapeSetButtonLayout in self.selectShapeSetLayout.subviews.values {
            (selectShapeSetButtonLayout.view as! UIButton).addTarget(self, action: "selectShapeSetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        /*self.selectShapeSetView = self.selectShapeSetLayout.view as! AKPickerView
        self.selectShapeSetView.delegate = self
        var defaultSelectedItemId: Int = self.selectShapeSetView.dataSource!.numberOfItemsInPickerView(self.selectShapeSetView)/2
        self.selectShapeSetView.selectItem(defaultSelectedItemId, animated: false)
        self.selectShapeSetView.reloadData()
        
        self.selectDifficultyLayout = self.settingsLayout["selectDifficulty"]
        for selectDifficultyButtonLayout in self.selectDifficultyLayout.subviews.values {
            (selectDifficultyButtonLayout.view as! UIButton).addTarget(self, action: "selectDifficultyButtonPressed:", forControlEvents: .TouchUpInside)
        }
        
        self.startGameButtonView = self.settingsLayout["startGameButton"]?.view as! UIButton
        self.startGameButtonView.addTarget(self, action: "startGameButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)*/
    }
    
    func selectShapeSetButtonPressed(sender: SelectShapeSetButton!) {
        for selectShapeSetButtonLayout in self.selectShapeSetLayout.subviews.values {
            var selectShapeSetButtonView = selectShapeSetButtonLayout.view as! SelectShapeSetButton
            if sender == selectShapeSetButtonView {
                selectShapeSetButtonView.tintColor = UIColor.whiteColor()
                
                var tempBackgroundView = self.settingsLayout["tempBackground"]!.view as! UIImageView
                tempBackgroundView.image = self.config.shapeSets[sender.index].settingsBackgroundImage
                tempBackgroundView.alpha = 0
                self.settingsLayout.showSubview("tempBackground")
                self.settingsView.sendSubviewToBack(tempBackgroundView)
                UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                    tempBackgroundView.alpha = 1
                }, completion: { (a) -> Void in
                    self.settingsView.image = self.config.shapeSets[sender.index].settingsBackgroundImage
                    self.settingsLayout.hideSubview("tempBackground")
                })
                if(self.shapeSetSelected == false) {
                    self.layoutAction.shapeSetSelected()
                    self.shapeSetSelected = true
                }
                
            } else {
                selectShapeSetButtonView.tintColor = self.config.shapeSets[sender.index].color
            }
        }
    }
    
    /*func pickerView(pickerView: AKPickerView, didSelectItem item: Int) {
        (self.settingsLayout.view as! UIImageView).image = self.config.shapeSets[item].settingsBackgroundImage
    }*/
    
    /*func selectDifficultyButtonPressed(sender: UIButton!) {
        
        for selectDifficultyButtonLayout in self.selectDifficultyLayout.subviews.values {
            var selectDifficultyButtonView = selectDifficultyButtonLayout.view as! UIButton
            if sender == selectDifficultyButtonView {
                selectDifficultyButtonView.selected = true
                self.settingsLayout.showSubview("startGameButton")
            } else {
                selectDifficultyButtonView.selected = false
            }
        }
        
    }*/
    
    func startGameButtonTapped(sender: UIButton!) {
        self.leaveSettings()
    }
    
    override func afterSettings() {
        /*self.gameModel.shapeSet = self.selectShapeSetView.selectedItem
        for (difficulty, selectDifficultyButtonLayout) in self.selectDifficultyLayout.subviews {
            if (selectDifficultyButtonLayout.view as! UIButton).selected == true {
                self.gameModel.difficulty = difficulty
            }
        }*/
    }
    
    override func gameDidStart() {

        self.gameLayout = self.layout["game"]
        (self.layout["background"]!.view as! UIImageView).image = self.config.shapeSets[self.gameModel.shapeSet].gameBackgroundImage
        
        self.thumbLayouts = [self.gameLayout["thumbLeft"]!, self.gameLayout["thumbCenter"]!, self.gameLayout["thumbRight"]!]
        for (id, thumbLayout) in enumerate(self.thumbLayouts) {
            var thumbLayoutView = thumbLayout.view as! GuessShapeThumbView
            thumbLayoutView.delegate = self
            thumbLayoutView.image = self.gameModel.shapes[id].thumbImage
            thumbLayoutView.shapeName = self.gameModel.shapes[id].thumbImageName
        }
        
        self.siluetteLayout = self.gameLayout["siluette"]
        self.siluetteView = self.siluetteLayout.view as! UIImageView
        self.siluetteView.image = self.gameModel.shapes[self.gameModel.correctShapeId].siluetteImage
    }
    
    func thumbDragBegan(#sender: GuessShapeThumbView) {
        
        sender.superview?.bringSubviewToFront(sender)
        
        self.layoutAction.thumbDragBegan()
    }
    func thumbDragMoved(#sender: GuessShapeThumbView) {
        self.layoutAction.thumbDragMoved()
    }
    func thumbDragEnded(#sender: GuessShapeThumbView) {
        
        self.layoutAction.thumbDragEnded()
        
        if self.siluetteLayout.view.frame.contains(sender.center) {
            if sender.shapeName == self.gameModel.shapes[self.gameModel.correctShapeId].thumbImageName {
                UIView.animateWithDuration(self.config.thumbToSiluetteAnimationDuration, delay: 0, options: .CurveEaseOut, animations: {
                    sender.frame = self.siluetteLayout.view.frame
                    }, completion: nil)
                self.gameLayout.view.userInteractionEnabled = false
                delay(self.config.delayAfterSuccess) {self.restartGame()}
                self.layoutAction.success()
                println("success")
            } else {
                sender.returnToDefaultPosition(animationDuration: self.config.thumbReturningAnimationDuration)
                self.layoutAction.failure()
                println("failure")
            }
        } else {
            sender.returnToDefaultPosition(animationDuration: self.config.thumbReturningAnimationDuration)
            self.layoutAction.dragEndedOutsideSiluette()
            println("outside the siluette area")
        }
        
    }
    
}