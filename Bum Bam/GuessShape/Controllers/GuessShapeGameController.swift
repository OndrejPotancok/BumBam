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
    
    var gameLayout: Layout!
    
    var thumbLayouts: [Layout]!
    var siluetteLayout: Layout!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! GuessShapeGameModel
        self.layoutAction = self.mainLayoutAction as! GuessShapeLayoutAction
        
    }
    
    override func gameDidStart() {
        
        self.gameLayout = self.layout["game"]
        
        self.thumbLayouts = [self.gameLayout["thumbLeft"]!, self.gameLayout["thumbCenter"]!, self.gameLayout["thumbRight"]!]
        for thumbLayout in self.thumbLayouts {
            (thumbLayout.view as! GuessShapeThumbView).delegate = self
        }
        
        self.siluetteLayout = self.gameLayout["siluette"]
        
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
            
            UIView.animateWithDuration(self.layoutAction.thumbToSiluetteAnimationDuration(), delay: 0, options: .CurveEaseOut, animations: {
                sender.frame = self.siluetteLayout.view.frame
            }, completion: nil)
            self.gameLayout.view.userInteractionEnabled = false
            delay(self.layoutAction.delayAfterSuccess()) {self.restartGame()}
            
            self.layoutAction.success()
        } else {
            sender.returnToDefaultPosition(animationDuration: self.layoutAction.thumbReturningAnimationDuration())
            self.layoutAction.failure()
        }
        
    }
    
}