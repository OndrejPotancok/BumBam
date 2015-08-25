//
//  SettingsBlockView.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 15/08/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class SettingsBlockView: UIScrollView {
    
    var name: String!
    var selectedIndex: Int = -1
    var toShow: Bool = true
    var shown: Bool = false
    
    func moveToY(centerY: CGFloat, delay delay1: Double, completion: (() -> ())!) -> Bool{
        let duration: Double = 1
        if self.center.y == centerY {
            if completion != nil {
                delay(delay1+duration) {
                    completion()
                }
            }
            return false
        }
        UIView.animateWithDuration(duration, delay: delay1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
            self.center.y = centerY
        }) { (a) -> Void in
            if completion != nil {
                completion()
            }
        }
        return true
    }
    
    func show(centerY: CGFloat, delay delay1: Double, completion: (() -> ())!) -> Bool {
        let duration: Double = 1
        if self.shown == true {
            if completion != nil {
                print(self.name)
                delay(delay1+duration) {
                    completion()
                }
            }
            return false
        }
        self.center.y = centerY
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width*2, self.frame.height)
        UIView.animateWithDuration(duration, delay: delay1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.8, options: [], animations: { () -> Void in
            self.frame.origin.x = 0
        }) { (a) -> Void in
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.width/2, self.frame.height)
            if completion != nil {
                completion()
            }
        }
        
        self.shown = true
        return true
    }
    
    func hide(delay1: Double, completion: ClosureClass!) -> Bool{
        let duration: Double = 0.2
        if self.shown == false {
            if completion != nil {
                delay(delay1+duration) {
                    completion.execute()
                }
            }
            return false
        }
        UIView.animateWithDuration(duration, delay: delay1, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            self.frame.origin.x = ScrnW
        }) { (a) -> Void in
            if completion != nil {
                completion.execute()
            }
        }
        self.shown = false
        return true
    }
}