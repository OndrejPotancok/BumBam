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
    
    var shapeSet: Int!
    var shapeSubSet: Int!
    var difficulty: String!
    
    var shapes: [GuessShapeHelper.Shape]!
    var correctShapeId: Int!
    
    override func set() {
        
        var permutation = GuessShapeConfig.shapeSets[self.shapeSet].shapeSubSets[self.shapeSubSet].shapes[self.difficulty]!
        shuffleArray(&permutation)
        self.shapes = [permutation[0], permutation[1], permutation[2]]
        self.correctShapeId = randomNumber(minX: 0, maxX: UInt32(self.shapes.count-1))
    }
    
}