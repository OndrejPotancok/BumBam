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
    
    var shapesToSelect: [String] = ["AbcdAbcdAbcd", "EfghEfghEfgh", "IjklIjklIjkl", "MnopMnopMnop", "QrstQrstQrst", "UvwxUvwxUvwx", "YzYzYz"]
}
var GuessShapeConfigInstance: GuessShapeConfig = GuessShapeConfig()