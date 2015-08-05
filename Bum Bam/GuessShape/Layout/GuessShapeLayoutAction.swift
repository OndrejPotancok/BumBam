//
//  GuessShapeLayoutAction.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeLayoutAction: GuessShapeDefaultLayoutAction {
    
    override func success() {
        self.layout["hud"]?.showSubview("success")
    }
    
    override func failure() {
        
        var siluetteView = self.layout["game"]!["siluette"]!.view
        var duration:NSTimeInterval = 0.15
        UIView.animateKeyframesWithDuration(duration*2, delay: 0, options: UIViewKeyframeAnimationOptions(/*UIViewKeyframeAnimationOptions.Repeat.rawValue | */UIViewAnimationOptions.CurveLinear.rawValue), animations: { () -> Void in
            UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 0.25, animations: { () -> Void in
                siluetteView.center = CGPointMake(siluetteView.center.x-10, siluetteView.center.y)
            })
            UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.5, animations: { () -> Void in
                siluetteView.center = CGPointMake(siluetteView.center.x+20, siluetteView.center.y)
            })
            UIView.addKeyframeWithRelativeStartTime(0.75, relativeDuration: 0.25, animations: { () -> Void in
                siluetteView.center = CGPointMake(siluetteView.center.x-10, siluetteView.center.y)
            })
        }, completion: nil)
    }
}