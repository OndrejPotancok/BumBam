//
//  helperFuncs.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 06/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

func randomNumber(#minX:UInt32, #maxX:UInt32) -> Int {
    let result = (arc4random() % (maxX - minX + 1)) + minX
    return Int(result)
}

func delay(seconds: Double, after: () -> ()) {
    var delay = Int64(seconds * Double(NSEC_PER_SEC))
    var delayTime = dispatch_time(DISPATCH_TIME_NOW, delay)
    dispatch_after(delayTime, dispatch_get_main_queue(),after)
}