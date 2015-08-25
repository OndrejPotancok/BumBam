//
//  ASGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class ASGameController: MainGameController {
    
    var gameModel: ASGameModel!
    var layoutAction: ASLayoutAction!
    
    var touchAreaView: UIButton!
    var animalView: UIImageView!
    var tempAnimalView: UIImageView!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! ASGameModel
        self.layoutAction = self.mainLayoutAction as! ASLayoutAction
        
    }
    
    override func gameDidStart() {
        self.touchAreaView = self.layout["game"]!["touchArea"]!.view as! UIButton
        self.animalView = self.layout["game"]!["animal"]!.view as! UIImageView
        self.tempAnimalView = self.layout["game"]!["tempAnimal"]!.view as! UIImageView
        
        self.touchAreaView.addTarget(self, action: "animalPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.animalView.image = ASConfig.animals[self.gameModel.animalIndex].image
        self.tempAnimalView.image = ASConfig.animals[self.gameModel.nextAnimalIndex].image
        
        ASConfig.animals[self.gameModel.animalIndex].sound.prepareToPlay()
    }
    func animalPressed(sender: UIButton) {
        self.touchAreaView.removeTarget(nil, action: nil, forControlEvents: .AllEvents)
        ASConfig.animals[self.gameModel.animalIndex].sound.play()
        delay(ASConfig.animals[self.gameModel.animalIndex].sound.duration) {
            self.layout["game"]!.showSubview("tempAnimal")
            UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                self.tempAnimalView.center.x = ScrnW/2
                self.animalView.center.x = -ScrnW/2
                //self.animalView.alpha = 0
                }) { (finished) -> Void in
                    self.restartGame()
            }
        }
    }
    
}