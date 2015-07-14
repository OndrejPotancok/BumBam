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
    var animalsImages: [[String]] = [
        ["cat", "dino", "giraffe"],
        ["goat","monkey", "sheep"]
    ]
}

    var GuessShapeConfigInstance: GuessShapeConfig = GuessShapeConfig()