//
//  MainGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class MainGameController: NSObject {
    
    var mainGameModel: MainGameModel
    var mainLayoutAction: MainLayoutAction
    var layout: Layout
    

    
    init(gameModel: MainGameModel,layoutAction: MainLayoutAction, layout: Layout) {
        self.mainGameModel = gameModel
        self.mainLayoutAction = layoutAction
        self.layout = layout
        self.mainLayoutAction.layout = self.layout
        
    }
    
    func willShowSettings() {
        
    }
    
    func showSettings() {
        if let settingsLayout = self.layout["settings"] {
            self.willShowSettings()
            self.layout.createOnlySubview("settings")
            self.layout.view.addSubview(settingsLayout.view)
            self.didShowSettings()
        } else {
            self.startGame()
        }

    }
    
    func didShowSettings() {
        
    }
    
    func leaveSettings() {
        self.afterSettings()
        self.startGame()
        if let backgroundLayout = self.layout["background"] {
            backgroundLayout.view.frame.origin.x = ScrnW
        }
        if let gameLayout = self.layout["game"]{
            gameLayout.view.frame.origin.x = ScrnW
        }
        if let hudLayout = self.layout["hud"] {
            hudLayout.view.frame.origin.x = ScrnW
        }
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            if let backgroundLayout = self.layout["background"] {
                backgroundLayout.view.frame.origin.x = 0
            }
            if let gameLayout = self.layout["game"]{
                gameLayout.view.frame.origin.x = 0
            }
            if let hudLayout = self.layout["hud"] {
                hudLayout.view.frame.origin.x = 0
            }
            if let settingsLayout = self.layout["settings"] {
                settingsLayout.view.frame.origin.x = -ScrnW
            }
        }) { (finished) -> Void in
            if let settingsLayout = self.layout["settings"] {
                settingsLayout.delete()
            }
        }
        
    }
    
    func afterSettings() {
        
    }
    
    func gameWillStart() {
        
    }
    
    func gameDidStart() {
        
    }
    
    func startGame() {
        self.gameWillStart()
        self.mainGameModel.set()
        if let backgroundLayout = self.layout["background"] {
            self.layout.createOnlySubview("background")
            self.layout.view.addSubview(backgroundLayout.view)
        }
        if let gameLayout = self.layout["game"]{
            self.layout.createOnlySubview("game")
            self.layout.view.addSubview(gameLayout.view)
            gameLayout.view.userInteractionEnabled = true
            gameLayout.view.backgroundColor = UIColor.clearColor()
        }
        if let hudLayout = self.layout["hud"] {
            self.layout.createOnlySubview("hud")
            self.layout.view.addSubview(hudLayout.view)
            hudLayout.view.userInteractionEnabled = false
            hudLayout.view.backgroundColor = UIColor.clearColor()
        }
        self.gameDidStart()
    }
    
    
    func restartGame() {
        if let backgroundLayout = self.layout["background"] {
            backgroundLayout.delete()
        }
        if let gameLayout = self.layout["game"]{
            gameLayout.delete()
        }
        if let hudLayout = self.layout["hud"] {
            hudLayout.delete()
        }
        self.startGame()
    }
    
    
    
    
    
    
    var settingsLayout: Layout!
    var settingsView: UIImageView!
    var settingsBlocksLayout: Layout!
    
    var defaultSettingsBlocks: [SettingsBlock]!
    var getSettingsColorAndImage: (() -> (UIColor, UIImage))!
    var updapeSettingsNewBlock: ((settingsBlock: SettingsBlock, settingsBlockLayout: MultiLayout, settingsBlockView: SettingsBlockView) -> ())!
    var beforeSettingsRefresh: ((settingsBockView: SettingsBlockView) -> ())!
    
    func showSettingsBlocks() {
        self.settingsLayout = self.layout["settings"]
        self.settingsView = self.settingsLayout.view as! UIImageView
        
        self.settingsBlocksLayout = self.settingsLayout["blocks"]
        for settingsBlock in GuessShapeConfig.defaultSettingsBlocks {
            for settingsBlockButtonLayout in self.settingsBlocksLayout[settingsBlock.name]!.subviews.values {
                (settingsBlockButtonLayout.view as! SettingsBlockButton).addTarget(self, action: "settingsBlockButtonPressed:", forControlEvents: .TouchUpInside)
            }
        }
        self.refreshSettings(nil, first: true)
    }
    
    func updateSettingsColor() {
        /*var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! SettingsBlockView).selectedIndex
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
            image = UIImage(named: "GuessShape-backgroundDefault")
        }*/
        let (color, image) = self.getSettingsColorAndImage()
        for settingsBlock in self.defaultSettingsBlocks {
            println(self.settingsBlocksLayout[settingsBlock.name]!.subviews.count)
            for (id,settingsBlockButtonLayout) in self.settingsBlocksLayout[settingsBlock.name]!.subviews {
                if id != String((self.settingsBlocksLayout[settingsBlock.name]!.view as! SettingsBlockView).selectedIndex){
                    settingsBlockButtonLayout.view.tintColor = color
                } else {
                    settingsBlockButtonLayout.view.tintColor = UIColor.whiteColor()
                }
            }
        }
        if self.settingsView.image == nil {
            self.settingsView.image = image
        }
        else if !self.settingsView.image!.isEqual(image) {
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
    
    func refreshSettings(lastSelectedBlockName: String!, first: Bool = false) {
        var foundLastSelectedBlock = lastSelectedBlockName != nil ? false : true
        
        var blocksCount: Int = 0
        var countToHide: Int = 0
        for settingsBlock in self.defaultSettingsBlocks {
            var settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]!
            var settingsBlockView = settingsBlockLayout.view as! SettingsBlockView
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
        var newBlockRefresh = ClosureClass {}
        for settingsBlock in self.defaultSettingsBlocks {
            var settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]! as! MultiLayout
            var settingsBlockView = settingsBlockLayout.view as! SettingsBlockView
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
                    /*switch settingsBlock.name {
                    case "selectShapeSet":
                        for index in 0..<settingsBlock.subviewsCount {
                            (settingsBlockLayout["\(index)"]!.view as! UIButton).setImage(GuessShapeConfig.shapeSets[index].settingsShapeSetImage!.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                        }
                    case "selectShapeSubSet":
                        var selectedShapeSetIndex = (self.settingsBlocksLayout["selectShapeSet"]!.view as! SettingsBlockView).selectedIndex
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
                        (settingsBlockLayout["0"]!.view as! UIButton).setImage(UIImage(named: "GuessShape-playButton")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                        settingsBlockView.selectedIndex = 0
                    default:
                        break
                    }*/
                    self.updapeSettingsNewBlock(settingsBlock: settingsBlock, settingsBlockLayout: settingsBlockLayout, settingsBlockView: settingsBlockView)
                    self.updateSettingsColor()
                    settingsBlockView.show(max(tempBlockYcenter, ScrnH*0.5), delay: first == true ? 0.3 : 0, completion: nil)
                    blockYcenter += blockYcentersDifferenceCoeff*ScrnH
                }
                foundNewBlock = true
            }
            if  true {
                var completion: ClosureClass! = nil
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
    
    func settingsBlockButtonPressed(sender: SettingsBlockButton!) {
        var blockView = sender.superview as! SettingsBlockView
        if blockView.name == "playButton" {
            self.leaveSettings()
            return
        }
        if blockView.selectedIndex == sender.index {
            return
        }
        blockView.selectedIndex = sender.index
        /*if blockView.name == "selectShapeSet" {
            var selectShapeSubSetBlockView = self.settingsBlocksLayout["selectShapeSubSet"]!.view as! SettingsBlockView
            if GuessShapeConfig.shapeSets[sender.index].shapeSubSets.count > 1 {
                selectShapeSubSetBlockView.toShow = true
            } else {
                selectShapeSubSetBlockView.selectedIndex = 0
                selectShapeSubSetBlockView.toShow = false
            }
        }*/
        self.beforeSettingsRefresh(settingsBockView: blockView)
        self.refreshSettings(blockView.name)
    }
    
    
    
}






