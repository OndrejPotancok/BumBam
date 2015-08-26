//
//  PZGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZGameController: MainGameController {
    
    var gameModel: PZGameModel!
    var layoutAction: PZLayoutAction!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! PZGameModel
        self.layoutAction = self.mainLayoutAction as! PZLayoutAction
        
    }

    
}