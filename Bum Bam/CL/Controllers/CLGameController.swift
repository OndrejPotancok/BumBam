//
//  CLGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class CLGameController: MainGameController {
    
    var gameModel: CLGameModel!
    var layoutAction: CLLayoutAction!
    
    var gameLayout: Layout!
    var imageView: UIImageView!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! CLGameModel
        self.layoutAction = self.mainLayoutAction as! CLLayoutAction
        
    }

    override func gameDidStart() {
        self.gameLayout = self.layout["game"]!
        self.imageView = self.gameLayout["image"]!.view as! UIImageView
    }
    
}