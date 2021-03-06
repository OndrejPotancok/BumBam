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
        self.willShowSettings()
        if let settingsLayout = self.layout["settings"] {
            self.layout.createOnlySubview("settings")
            self.layout.view.addSubview(settingsLayout.view)
        } else {
            self.leaveSettings()
        }
        self.didShowSettings()

    }
    
    func didShowSettings() {
        
    }
    
    func leaveSettings() {
        self.afterSettings()
        if let settingsLayout = self.layout["settings"] {
            settingsLayout.delete()
        }
        
        self.startGame()
    }
    
    func afterSettings() {
        
    }
    
    func gameWillStart() {
        
    }
    
    func gameDidStart() {
        
    }
    
    func startGame() {
        self.gameWillStart()
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






