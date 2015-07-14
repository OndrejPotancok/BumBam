//
//  GuessShapeModel.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeGameModel: MainGameModel {
    
    weak var config: GuessShapeConfig! = GuessShapeConfigInstance
    
    var shape: Int!
    
    
    var thumbNames: [String]!
    var siluetteName: String!
    var backgroundImage: String!
    
    override func set() {
        var permutaion = self.config.animalsImages[shape]
        shuffleArray(&permutaion)
        
        self.thumbNames = [permutaion[0], permutaion[1], permutaion[2]]
        self.siluetteName = self.thumbNames[randomNumber(minX: 0, maxX: UInt32(self.thumbNames.count-1))]
    }
    
}