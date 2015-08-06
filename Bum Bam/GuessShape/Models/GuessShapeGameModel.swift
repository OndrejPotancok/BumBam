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
    
    var shapeSet: Int!
    var difficulty: String!
    
    var shapes: [GuessShapeConfig.Shape]!
    var correctShapeId: Int!
    
    override func set() {
        
        var permutation = self.config.shapeSets[shapeSet].shapes[self.difficulty]!
        shuffleArray(&permutation)
        self.shapes = [permutation[0], permutation[1], permutation[2]]
        self.correctShapeId = randomNumber(minX: 0, maxX: UInt32(self.shapes.count-1))
    }
    
}