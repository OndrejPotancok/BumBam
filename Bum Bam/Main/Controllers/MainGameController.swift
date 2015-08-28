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
    
    func updateSubviewsCountOfSettingsBlock(settingsBlock: SettingsBlock, count: Int) {
        settingsBlock.subviewsCount = count
        let settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]! as! MultiLayout
        settingsBlockLayout.recreateSubviews(count)
        for settingsBlockButtonLayout in settingsBlockLayout.subviews.values {
            (settingsBlockButtonLayout.view as! SettingsBlockButton).addTarget(self, action: "settingsBlockButtonPressed:", forControlEvents: .TouchUpInside)
        }
        (settingsBlockLayout.view as! UIScrollView).contentSize = getSliderContentSize(count)
    }
    
    func updateSettingsColor() {
        let (color, image) = self.getSettingsColorAndImage()
        
        for settingsBlock in self.defaultSettingsBlocks {
            let selectedIndex = String((self.settingsBlocksLayout[settingsBlock.name]!.view as! SettingsBlockView).selectedIndex)
            for (id,settingsBlockButtonLayout) in self.settingsBlocksLayout[settingsBlock.name]!.subviews {
                if id != selectedIndex {
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
            let tempBackgroundView = self.settingsLayout["tempBackground"]!.view as! UIImageView
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
            let settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]!
            let settingsBlockView = settingsBlockLayout.view as! SettingsBlockView
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
        
        let blockYcentersDifferenceCoeff: CGFloat = (1/CGFloat(blocksCount+1))
        var blockYcenter = blockYcentersDifferenceCoeff*ScrnH
        var leftCountToHide = countToHide
        let newBlockRefresh = ClosureClass {}
        for settingsBlock in self.defaultSettingsBlocks {
            let settingsBlockLayout = self.settingsBlocksLayout[settingsBlock.name]! as! MultiLayout
            let settingsBlockView = settingsBlockLayout.view as! SettingsBlockView
            if foundLastSelectedBlock == false && settingsBlockView.toShow == true {
                settingsBlockView.moveToY(blockYcenter, delay: Double(countToHide)*0.3, completion: nil)
                blockYcenter += blockYcentersDifferenceCoeff*ScrnH
                if settingsBlockView.name == lastSelectedBlockName {
                    foundLastSelectedBlock = true
                }
                continue
            } else if foundNewBlock == false && settingsBlockView.toShow == true {
                let tempBlockYcenter = blockYcenter
                newBlockRefresh.change {
                    settingsBlockView.selectedIndex = -1
                    
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
        let blockView = sender.superview as! SettingsBlockView
        if blockView.name == "playButton" {
            self.leaveSettings()
            return
        }
        if blockView.selectedIndex == sender.index {
            return
        }
        blockView.selectedIndex = sender.index
        self.beforeSettingsRefresh(settingsBockView: blockView)
        self.refreshSettings(blockView.name)
    }
    
    
    
}






