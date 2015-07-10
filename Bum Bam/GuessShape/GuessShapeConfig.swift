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
    var delayAfterSuccess: Double = 2
    
    var backgroundColors: [UIColor] = [
        UIColor.greenColor(),
        UIColor.blueColor(),
        UIColor.brownColor(),
        UIColor.yellowColor(),
        UIColor.redColor()
    ]
    
    var shapesToSelectImageNames: [String] = [
        "PickerViewGameIconGame1",
        "PickerViewGameIconGame2"
    ]
    
    var imageNamesPrefix = "GuessShape-"
    var animalsImages: [[String]] = [
        ["cat", "dino", "giraffe"],
        ["goat","monkey", "sheep"]
    ]
}

    var GuessShapeConfigInstance: GuessShapeConfig = GuessShapeConfig()