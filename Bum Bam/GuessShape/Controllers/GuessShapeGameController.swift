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
    
    //var playButtonView: UIButton!
    
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
        
        self.defaultSettingsBlocks = GuessShapeConfig.defaultSettingsBlocks
        self.getSettingsColorAndImage = {
            var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! SettingsBlockView).selectedIndex
            var selectedShapeSubSetIndex = (self.settingsBlocksLayout["selectShapeSubSet"]!.view as! SettingsBlockView).selectedIndex
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
                image = UIImage(named: "backgroundDefault")
            }
            return (color, image)
        }
        self.updapeSettingsNewBlock = {(settingsBlock, settingsBlockLayout, settingsBlockView) in
            switch settingsBlock.name {
            case "selectShapeSet":
                for index in 0..<settingsBlock.subviewsCount {
                    (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(GuessShapeConfig.shapeSets[index].settingsShapeSetImage!.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                }
            case "selectShapeSubSet":
                var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! SettingsBlockView).selectedIndex
                self.updateSubviewsCountOfSettingsBlock(settingsBlock, count: GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets.count)
                for index in 0..<settingsBlock.subviewsCount {
                    (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(
                        GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets[index].settingsShapeSubSetImage!.imageWithRenderingMode(.AlwaysTemplate),
                        forState: .Normal
                    )
                }
            case "selectDifficulty":
                var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! SettingsBlockView).selectedIndex
                var shapeSubSetBlockView = self.settingsBlocksLayout["selectShapeSubSet"]!.view as! SettingsBlockView
                if shapeSubSetBlockView.selectedIndex == -1 {shapeSubSetBlockView.selectedIndex = 0}
                var selectedShapeSubSetIndex = shapeSubSetBlockView.selectedIndex
                for index in 0..<settingsBlock.subviewsCount {
                    (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(
                        GuessShapeConfig.shapeSets[selectedShapeSetIndex].shapeSubSets[selectedShapeSubSetIndex].settingsDifficultyImages[index]!.imageWithRenderingMode(.AlwaysTemplate),
                        forState: .Normal
                    )
                }
            case "playButton":
                (settingsBlockLayout["0"]!.view as! UIButton).setImage(UIImage(named: "playButton")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                settingsBlockView.selectedIndex = 0
            default:
                break
            }
        }
        self.beforeSettingsRefresh = {(settingsBlockView) in
            if settingsBlockView.name == "selectShapeSet" {
                var selectShapeSubSetBlockView = self.settingsBlocksLayout["selectShapeSubSet"]!.view as! SettingsBlockView
                if GuessShapeConfig.shapeSets[settingsBlockView.selectedIndex].shapeSubSets.count > 1 {
                    selectShapeSubSetBlockView.toShow = true
                } else {
                    selectShapeSubSetBlockView.selectedIndex = 0
                    selectShapeSubSetBlockView.toShow = false
                }
            }
        }
        self.showSettingsBlocks()
    }
    
    
    
    override func afterSettings() {
        self.gameModel.shapeSet = (self.settingsBlocksLayout["selectShapeSet"]!.view as! SettingsBlockView).selectedIndex
        self.gameModel.shapeSubSet = (self.settingsBlocksLayout["selectShapeSubSet"]!.view as! SettingsBlockView).selectedIndex
        self.gameModel.difficulty = ["easy","medium","hard"][(self.settingsBlocksLayout["selectDifficulty"]!.view as! SettingsBlockView).selectedIndex]
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