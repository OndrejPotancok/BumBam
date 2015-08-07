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
    
    override func didShowSettings() {
        var view = self.layout["settings"]!["selectShapeSet"]!.view
        view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width*2, view.frame.height)
        UIView.animateWithDuration(1.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.layout["settings"]!["selectShapeSet"]!.view.frame.origin.x = 0
        }) { (a) -> Void in
            view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width/2, view.frame.height)
        }
    }
    
    override func shapeSetSelected() {
        /*UIView.animateWithDuration(0.4, delay: 0.15, options: .CurveEaseInOut, animations: { () -> Void in*/
        UIView.animateWithDuration(1.5, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.layout["settings"]!["selectShapeSet"]!.view.center.y = ScrnH*(1/4)
        }, completion: nil)
        UIView.animateWithDuration(1.5, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.layout["settings"]!["selectDifficulty"]!.view.frame.origin.x = 0
        }, completion: nil)
    }
    
    override func difficultySelected() {
        UIView.animateWithDuration(1.5, delay: 0.2, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.layout["settings"]!["playButton"]!.view.center.x = ScrnW*0.5
        }, completion: nil)
    }
    
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