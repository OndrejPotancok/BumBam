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
    
}






