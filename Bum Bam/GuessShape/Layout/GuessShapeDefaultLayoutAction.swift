//
//  GuessShapeDefaultLayoutAction.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeDefaultLayoutAction: MainLayoutAction {
    
    func thumbDragBegan() {}
    func thumbDragMoved() {}
    func thumbDragEnded() {}
    func success() {}
    func failure() {}
    
    
    func thumbReturningAnimationDuration() -> NSTimeInterval {return 1}
    func thumbToSiluetteAnimationDuration() -> NSTimeInterval {return 1}
    func delayAfterSuccess() -> Double {return 2}
    
}