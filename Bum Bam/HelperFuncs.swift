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

extension CGRect {
    
    init(centerx: CGFloat,centery: CGFloat,width: CGFloat,height: CGFloat) {
        self.init(x: centerx - width / 2, y: centery - height / 2, width: width, height: height)
    }
    
}


func shuffleArray<T>(inout array: [T]) {
    
    for(var i = array.count-1; i != 0; --i) {
        var j = randomNumber(minX: UInt32(0), maxX: UInt32(i))
        swap(&array[j], &array[i])
    }
    
}