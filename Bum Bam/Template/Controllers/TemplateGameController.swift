//
//  TemplateGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class TemplateGameController: MainGameController {
    
    var gameModel: TemplateGameModel!
    var layoutAction: TemplateLayoutAction!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! TemplateGameModel
        self.layoutAction = self.mainLayoutAction as! TemplateLayoutAction
        
    }

    
}