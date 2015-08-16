//
//  GuessShapeSettingsBlockView.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 15/08/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeSettingsBlockView: UIScrollView {
    
    var name: String!
    var selectedIndex: Int! = -1
    var shown: Bool = false
    
    func moveToY(centerY: CGFloat, delay: NSTimeInterval, completion: (() -> ())!) {
        if self.center.y == centerY {
            if completion != nil {
                completion()
            }
            return
        }
        UIView.animateWithDuration(1.5, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.center.y = centerY
        }) { (a) -> Void in
            if completion != nil {
                completion()
            }
        }
    }
    
    func show(centerY: CGFloat, delay: NSTimeInterval, completion: (() -> ())!) {
        if self.shown == true {
            if completion != nil {
                completion()
            }
            return
        }
        self.center.y = centerY
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width*2, self.frame.height)
        UIView.animateWithDuration(1.5, delay: delay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: nil, animations: { () -> Void in
            self.frame.origin.x = 0
        }) { (a) -> Void in
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width/2, self.frame.height)
            if completion != nil {
                completion()
            }
        }
        
        self.shown = true
    }
    
    func hide(delay: NSTimeInterval, completion: (() -> ())!) {
        if self.shown == false {
            if completion != nil {
                completion()
            }
            return
        }
        UIView.animateWithDuration(0.3, delay: delay, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.frame.origin.x = ScrnW
        }) { (a) -> Void in
            if completion != nil {
                completion()
            }
        }
        self.selectedIndex = -1
        self.shown = false
    }
}