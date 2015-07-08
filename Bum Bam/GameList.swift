//
//  GameLists.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

var gameModelArray: [MainGameModel] = [
    TestGameModel(name: "Test", codeName: "Test"),
    TemplateGameModel(name: "Template", codeName: "Template")
]

extension MainGameController {
    
    class func createGameControllerByGameName(gameName: String) -> MainGameController? {
        
        switch(gameName) {
        case gameModelArray[0].name:
            return TestGameController(gameModel: gameModelArray[0], layoutAction: TestLayoutAction(), layout: TestLayout().layout)
        case gameModelArray[1].name:
            return TemplateGameController(gameModel: gameModelArray[1], layoutAction: TemplateLayoutAction(), layout: TemplateLayout().layout)
        default:
            return nil
        }
        
    }
    
}