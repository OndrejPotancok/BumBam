//
//  TestGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class TestGameController: MainGameController, PTestMainImageViewDelegate {
    
    var gameModel: TestGameModel!
    var layoutAction: TestLayoutAction!
    
    var startGameButton: UIButton!
    var label: UILabel!
    var mainImage: TestMainImageView!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! TestGameModel
        self.layoutAction = self.mainLayoutAction as! TestLayoutAction
        
        }
    
    func mainImagetouchesBegan() {
        self.layout["game"]?.hideSubview("row")
        self.layoutAction.mainImageTouchesBegan()
        delay(3) {
            self.restartGame()
        }
    }
    
    func startGameButtonPressed(sender:UIButton!) {
        self.leaveSettings()
    }
    
    override func didShowSettings() {
        self.startGameButton = self.layout["settings"]?["startGameButton"]?.view as! UIButton
        self.startGameButton.addTarget(self, action: "startGameButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    override func afterSettings() {
        
        self.gameModel.cowCount = 4
        self.gameModel.labelText = (self.layout["settings"]?["text"]?.view as! UITextField).text
    }
    
    override func gameWillStart() {
        (self.layout["game"]?["row"] as? MultiLayout)?.count = self.gameModel.cowCount
    }
    
    override func gameDidStart() {
        self.label = self.layout["game"]?["label"]?.view as! UILabel
        self.label.text = self.gameModel.labelText
        self.mainImage = self.layout["game"]?["mainImage"]?.view as! TestMainImageView
        self.mainImage.delegate = self
        
        delay(2) {
            self.layout["game"]?.showSubview("mainImage")
        }
    }
    
}