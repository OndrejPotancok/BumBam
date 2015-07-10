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
    var selectShapeLayout: Layout!
    var selectShapeView: AKPickerView!
    
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
        self.settingsLayout = self.layout["settings"]
        self.selectShapeLayout = self.settingsLayout["selectShape"]
        self.selectShapeView = self.selectShapeLayout.view as! AKPickerView
        
        self.selectShapeView.delegate = self
        self.selectShapeView.reloadData()
    }
    
    override func gameDidStart() {
        
        self.gameLayout = self.layout["game"]
        
        self.thumbLayouts = [self.gameLayout["thumbLeft"]!, self.gameLayout["thumbCenter"]!, self.gameLayout["thumbRight"]!]
        for (id, thumbLayout) in enumerate(self.thumbLayouts) {
            var thumbLayoutView = thumbLayout.view as! GuessShapeThumbView
            thumbLayoutView.delegate = self
            thumbLayoutView.image = UIImage(named: "\(self.config.imageNamesPrefix)\(self.gameModel.thumbNames[id])")
        }
        
        self.siluetteLayout = self.gameLayout["siluette"]
        self.siluetteView = self.siluetteLayout.view as! UIImageView
        self.siluetteView.image = UIImage(named: "\(self.config.imageNamesPrefix)\(self.gameModel.siluetteName)Siluette")
        
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
            
            UIView.animateWithDuration(self.config.thumbToSiluetteAnimationDuration, delay: 0, options: .CurveEaseOut, animations: {
                sender.frame = self.siluetteLayout.view.frame
            }, completion: nil)
            self.gameLayout.view.userInteractionEnabled = false
            delay(self.config.delayAfterSuccess) {self.restartGame()}
            
            self.layoutAction.success()
        } else {
            sender.returnToDefaultPosition(animationDuration: self.config.thumbReturningAnimationDuration)
            self.layoutAction.dragEndedOutsideSiluette()
        }
        
    }
    
}