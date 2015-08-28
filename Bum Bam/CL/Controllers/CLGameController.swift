//
//  CLGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class CLGameController: MainGameController, PCLImageViewDelegate {
    
    var gameModel: CLGameModel!
    var layoutAction: CLLayoutAction!
    
    var gameLayout: Layout!
    var imageView: CLImageView!
    
    var currentColor: UIColor?
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! CLGameModel
        self.layoutAction = self.mainLayoutAction as! CLLayoutAction
        
    }

    override func gameDidStart() {
        self.gameLayout = self.layout["game"]!
        self.imageView = self.gameLayout["image"]!.view as! CLImageView
        self.imageView.delegate = self
        for buttonLayout in self.gameLayout["slider"]!.subviews.values {
            (buttonLayout.view as! UIButton).addTarget(self, action: "colorButtonTapped:", forControlEvents: .TouchUpInside)
        }
    }
    
    func colorButtonTapped(sender: UIButton!) {
        self.currentColor = sender.backgroundColor
    }
    
    func getCurrentColor() -> UIColor? {
        return self.currentColor
    }
    
}