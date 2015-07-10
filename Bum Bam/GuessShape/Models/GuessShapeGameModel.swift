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
    
    var shape: String!
    
    
    var thumbNames: [String]!
    var siluetteName: String!
    var backgroundColor: UIColor!
    
    override func set() {
        var permutaion = self.config.animalsImages
        shuffleArray(&permutaion)
        
        self.thumbNames = [permutaion[0], permutaion[1], permutaion[2]]
        self.siluetteName = self.thumbNames[randomNumber(minX: 0, maxX: UInt32(self.thumbNames.count-1))]
        
        
        //if self.backgroundColor != nil {println("previous background image was \(self.backgroundColor)")}
        self.backgroundColor = self.config.backgroundColors[randomNumber(minX: 0, maxX: UInt32(self.config.backgroundColors.count-1))]
        //println("set background color to: \(self.backgroundColor)")
    }
    
}