//
//  GuessShapeGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeGameController: MainGameController, PGuessShapeThumbViewDelegate {
    
    var gameModel: GuessShapeGameModel!
    var layoutAction: GuessShapeLayoutAction!
    
    var settingsLayout: Layout!
    var settingsView: UIImageView!
    var settingsBlocksLayout: Layout!
    /*var selectShapeSetLayout: Layout!
    var selectedShapeSet: Int = -1
    var selectDifficultyLayout: Layout!
    var selectedDifficulty: Int = -1*/
    var playButtonView: UIButton!
    
    var gameLayout: Layout!
    
    var thumbLayouts: [Layout]!
    var siluetteLayout: Layout!
    var siluetteView: UIImageView!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! GuessShapeGameModel
        self.layoutAction = self.mainLayoutAction as! GuessShapeLayoutAction
    }
    
    override func didShowSettings() {
        self.layoutAction.didShowSettings()
        self.settingsLayout = self.layout["settings"]
        self.settingsView = self.settingsLayout.view as! UIImageView
        
        self.settingsBlocksLayout = self.settingsLayout["blocks"]
        for settingsBlock in GuessShapeConfig.defaultSettingsBlocks {
            for settingsBlockButtonLayout in self.settingsBlocksLayout[settingsBlock.name]!.subviews.values {
                (settingsBlockButtonLayout.view as! GuessShapeSettingsBlockButton).addTarget(self, action: "settingsBlockButtonPressed:", forControlEvents: .TouchUpInside)
            }
        }
        /*self.selectShapeSetLayout = self.settingsLayout["blocks"]!["selectShapeSet"]
        for selectShapeSetButtonLayout in self.selectShapeSetLayout.subviews.values {
            (selectShapeSetButtonLayout.view as! UIButton).addTarget(self, action: "selectShapeSetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        self.selectDifficultyLayout = self.settingsLayout["blocks"]!["selectDifficulty"]!
        for selectDifficultyButtonLayout in self.selectDifficultyLayout.subviews.values {
            (selectDifficultyButtonLayout.view as! UIButton).addTarget(self, action: "selectDifficultyButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        }
        self.playButtonView = self.settingsLayout["playButton"]!.view as! UIButton
        self.playButtonView.addTarget(self, action: "playButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)*/
        delay(0.3){
            self.refreshSettings(nil)
        }
    }
    
    /*func updateSettingsColor() {
        var color = self.config.shapeSets[self.selectedShapeSet].color
        for (id, selectShapeSetButtonLayout) in self.selectShapeSetLayout.subviews {
            if id != String(self.selectedShapeSet) {
                selectShapeSetButtonLayout.view.tintColor = color
            } else {
                selectShapeSetButtonLayout.view.tintColor = UIColor.whiteColor()
            }
        }
        for (id, selectDifficultyButtonLayout) in self.selectDifficultyLayout.subviews {
            if id != String(self.selectedDifficulty) {
                selectDifficultyButtonLayout.view.tintColor = color
            } else {
                selectDifficultyButtonLayout.view.tintColor = UIColor.whiteColor()
            }
        }
    }*/
    
    func updateSettingsColor() {
        var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! GuessShapeSettingsBlockView).selectedIndex
        var selectedShapeSubSetIndex = (self.settingsBlocksLayout["selectShapeSubSet"]!.view as! GuessShapeSettingsBlockView).selectedIndex
        var color: UIColor!
        var image: UIImage!
        if selectedShapeSetIndex != -1 {
            if selectedShapeSubSetIndex != -1 {
                color = GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets[selectedShapeSubSetIndex].color
                image = GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets[selectedShapeSubSetIndex].settingsBackgroundImage
            } else {
                color = GuessShapeConfig.shapeSets[selectedShapeSetIndex].color
                image = GuessShapeConfig.shapeSets[selectedShapeSetIndex].settingsBackgroundImage
            }
        } else {
            color = UIColor(red: 182/255, green: 139/255, blue: 55/255, alpha: 1)
            image = UIImage(named: "GuessShape-backgroundDefault")
        }
        for settingsBlock in GuessShapeConfig.defaultSettingsBlocks {
            for (id,settingsBlockButtonLayout) in self.settingsBlocksLayout[settingsBlock.name]!.subviews {
                if id != String((self.settingsBlocksLayout[settingsBlock.name]!.view as! GuessShapeSettingsBlockView).selectedIndex){
                    settingsBlockButtonLayout.view.tintColor = color
                } else {
                    settingsBlockButtonLayout.view.tintColor = UIColor.whiteColor()
                }
            }
        }
        if !self.settingsView.image!.isEqual(image) {
            var tempBackgroundView = self.settingsLayout["tempBackground"]!.view as! UIImageView
            tempBackgroundView.image = image
            tempBackgroundView.alpha = 0
            self.settingsLayout.showSubview("tempBackground")
            self.settingsView.sendSubviewToBack(tempBackgroundView)
            UIView.animateWithDuration(0.7, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                tempBackgroundView.alpha = 1
                }, completion: { (a) -> Void in
                    self.settingsView.image = tempBackgroundView.image
                    self.settingsLayout.hideSubview("tempBackground")
            })
        }
    }
    
    func refreshSettings(lastSelectedBlockName: String!) {
        var foundLastSelectedBlock = lastSelectedBlockName != nil ? false : true
        
        var blocksCount: Int = 0
        var countToHide: Int = 0
        for settingsBlock in GuessShapeConfig.defaultSettingsBlocks {
            var settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]!
            var settingsBlockView = settingsBlockLayout.view as! GuessShapeSettingsBlockView
            if settingsBlockView.toShow == true {
                blocksCount++
            }
            if foundLastSelectedBlock == false {
                if settingsBlock.name == lastSelectedBlockName {
                    foundLastSelectedBlock = true
                }
            } else {
                if settingsBlockView.shown == true {
                    countToHide++
                }
            }
            
        }
        
        foundLastSelectedBlock = lastSelectedBlockName != nil ? false : true
        var foundNewBlock = false
        var foundFirstBlockToHide = false
        
        var blockYcentersDifferenceCoeff: CGFloat = (1/CGFloat(blocksCount+1))
        var blockYcenter = blockYcentersDifferenceCoeff*ScrnH
        var leftCountToHide = countToHide
        var newBlockRefresh = GuessShapeHelper.ClosureClass {}
        for settingsBlock in GuessShapeConfig.defaultSettingsBlocks {
            var settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]!
            var settingsBlockView = settingsBlockLayout.view as! GuessShapeSettingsBlockView
            if foundLastSelectedBlock == false && settingsBlockView.toShow == true {
                settingsBlockView.moveToY(blockYcenter, delay: Double(countToHide)*0.3, completion: nil)
                blockYcenter += blockYcentersDifferenceCoeff*ScrnH
                if settingsBlockView.name == lastSelectedBlockName {
                    foundLastSelectedBlock = true
                }
                continue
            } else if foundNewBlock == false && settingsBlockView.toShow == true {
                var tempBlockYcenter = blockYcenter
                newBlockRefresh.change {
                    settingsBlockView.selectedIndex = -1
                    switch settingsBlock.name {
                    case "selectShapeSet":
                        for index in 0..<settingsBlock.subviewsCount {
                            (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(GuessShapeConfig.shapeSets[index].settingsShapeSetImage!.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                        }
                    case "selectShapeSubSet":
                        var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! GuessShapeSettingsBlockView).selectedIndex
                        for index in 0..<settingsBlock.subviewsCount {
                            (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(
                                GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets[index].settingsShapeSubSetImage!.imageWithRenderingMode(.AlwaysTemplate),
                                forState: .Normal
                            )
                        }
                    case "selectDifficulty":
                        var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! GuessShapeSettingsBlockView).selectedIndex
                        var shapeSubSetBlockView = self.settingsBlocksLayout["selectShapeSubSet"]!.view as! GuessShapeSettingsBlockView
                        if shapeSubSetBlockView.selectedIndex == -1 {shapeSubSetBlockView.selectedIndex = 0}
                        var selectedShapeSubSetIndex = shapeSubSetBlockView.selectedIndex
                        for index in 0..<settingsBlock.subviewsCount {
                            (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(
                                GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets[selectedShapeSubSetIndex].settingsDifficultyImages[index]!.imageWithRenderingMode(.AlwaysTemplate),
                                forState: .Normal
                            )
                        }
                    case "playButton":
                        (settingsBlockLayout["0"]!.view as! UIButton).setImage(UIImage(named: "GuessShape-playButton")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                        settingsBlockView.selectedIndex = 0
                    default:
                        break
                    }
                    self.updateSettingsColor()
                    settingsBlockView.show(max(tempBlockYcenter, ScrnH*0.5), delay: 0, completion: nil)
                    blockYcenter += blockYcentersDifferenceCoeff*ScrnH
                }
                foundNewBlock = true
            }
            if  true {
                var completion: GuessShapeHelper.ClosureClass! = nil
                if foundFirstBlockToHide == false && (settingsBlockView.shown == true || countToHide == 0) {
                    completion = newBlockRefresh
                    foundFirstBlockToHide = true
                    if settingsBlock.name == "playButton" {
                        completion.execute()
                        continue
                    }
                }
                if settingsBlockView.hide(Double(leftCountToHide-1)*0.3, completion: completion) == true {
                    leftCountToHide--
                }
            }
        }
    }
    
    func settingsBlockButtonPressed(sender: GuessShapeSettingsBlockButton!) {
        var blockView = sender.superview as! GuessShapeSettingsBlockView
        if blockView.name == "playButton" {
            self.leaveSettings()
            return
        }
        if blockView.selectedIndex == sender.index {
            return
        }
        blockView.selectedIndex = sender.index
        if blockView.name == "selectShapeSet" {
            var selectShapeSubSetBlockView = self.settingsBlocksLayout["selectShapeSubSet"]!.view as! GuessShapeSettingsBlockView
            if GuessShapeConfig.shapeSets[sender.index].shapeSubSets.count > 1 {
                selectShapeSubSetBlockView.toShow = true
            } else {
                selectShapeSubSetBlockView.selectedIndex = 0
                selectShapeSubSetBlockView.toShow = false
            }
        }
        self.refreshSettings(blockView.name)
    }
    
    /*func selectShapeSetButtonPressed(sender: SelectShapeSetButton!) {
        for selectShapeSetButtonLayout in self.selectShapeSetLayout.subviews.values {
            var selectShapeSetButtonView = selectShapeSetButtonLayout.view as! SelectShapeSetButton
            if sender == selectShapeSetButtonView {
                
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
                if(self.selectedShapeSet < 0) {
                    self.layoutAction.shapeSetSelected()
                }
                self.selectedShapeSet = sender.index
                for index in 0..<3 {
                    (self.selectDifficultyLayout["\(index)"]!.view as! UIButton).setImage(self.config.shapeSets[sender.index].settingsDifficultyImages[index]?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                }
                self.updateSettingsColor()
            }
        }
    }
    
    func selectDifficultyButtonPressed(sender: SelectDifficultyButton!) {
        for selectDifficultyButtonLayout in self.selectDifficultyLayout.subviews.values {
            var selectDifficultyButtonView = selectDifficultyButtonLayout.view as! SelectDifficultyButton
            if sender == selectDifficultyButtonView {
                if self.selectedDifficulty < 0 {
                    self.layoutAction.difficultySelected()
                }
                self.selectedDifficulty = sender.index
                self.updateSettingsColor()
            }
        }
    }
    
    func playButtonPressed(sender: UIButton!) {
        self.leaveSettings()
    }*/
    
    override func afterSettings() {
        self.gameModel.shapeSet = (self.settingsBlocksLayout["selectShapeSet"]!.view as! GuessShapeSettingsBlockView).selectedIndex
        self.gameModel.shapeSubSet = (self.settingsBlocksLayout["selectShapeSubSet"]!.view as! GuessShapeSettingsBlockView).selectedIndex
        self.gameModel.difficulty = ["easy","medium","hard"][(self.settingsBlocksLayout["selectDifficulty"]!.view as! GuessShapeSettingsBlockView).selectedIndex]
    }
    
    override func gameDidStart() {

        self.gameLayout = self.layout["game"]
        (self.layout["background"]!.view as! UIImageView).image = GuessShapeConfig.shapeSets[self.gameModel.shapeSet].shapeSubSets[self.gameModel.shapeSubSet].gameBackgroundImage
        
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
                UIView.animateWithDuration(GuessShapeConfig.thumbToSiluetteAnimationDuration, delay: 0, options: .CurveEaseOut, animations: {
                    sender.frame = self.siluetteLayout.view.frame
                    }, completion: nil)
                self.gameLayout.view.userInteractionEnabled = false
                delay(GuessShapeConfig.delayAfterSuccess) {self.restartGame()}
                self.layoutAction.success()
                println("success")
            } else {
                sender.returnToDefaultPosition(animationDuration: GuessShapeConfig.thumbReturningAnimationDuration)
                self.layoutAction.failure()
                println("failure")
            }
        } else {
            sender.returnToDefaultPosition(animationDuration: GuessShapeConfig.thumbReturningAnimationDuration)
            self.layoutAction.dragEndedOutsideSiluette()
            println("outside the siluette area")
        }
        
    }
    
}