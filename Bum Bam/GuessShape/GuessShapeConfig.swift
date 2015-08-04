//
//  GuessShapeConfig.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 10/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeConfig {
    
    var thumbReturningAnimationDuration: NSTimeInterval = 0.3
    var thumbToSiluetteAnimationDuration: NSTimeInterval = 0.3
    var delayAfterSuccess: Double = 1
    
    var backgroundImages: [String] = [
        "",
        "backgroundGame"
    ]
    
    
    var shapesToSelectImageNames: [String] = [
        "gameIconShapes",
        "gameIconAnimals"
    ]
    
    var imageNamesPrefix = "GuessShape-"
    var animalsImages: [[String: [String]]] = [
        [
            "easy": ["cat", "dino", "giraffe"],
            "medium": ["goat", "dino", "sheep"],
            "hard": ["cat","giraffe","monkey"]
        ],
        [
            "easy": ["goat","monkey", "sheep"],
            "medium": ["sheep","goat","cat"],
            "hard": ["giraffe","sheep","monkey"]
        ]
    ]
}

    var GuessShapeConfigInstance: GuessShapeConfig = GuessShapeConfig()