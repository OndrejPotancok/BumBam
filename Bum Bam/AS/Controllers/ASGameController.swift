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
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! ASGameModel
        self.layoutAction = self.mainLayoutAction as! ASLayoutAction
        
    }

    
}