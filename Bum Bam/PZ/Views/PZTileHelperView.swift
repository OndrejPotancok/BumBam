//
//  PZTileHelper.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/26/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZTileHelperView: UIImageView, subviewOfMultiLayout {
    
    var index: Int!
    
    var tile: PZTileView!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.tile.state == PZTileView.State.Moving {
            self.tile.touchesMoved(touches, withEvent: event)
        }
        if let point = touches.first?.locationInView(self.tile.superview) {
            if self.tile.state == PZTileView.State.InSlider && point.y < self.superview!.frame.origin.y {
                let slider = self.superview as! UIScrollView
                slider.scrollEnabled = false
                self.tile.touchesBegan(touches, withEvent: event)
            }
        }
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        if self.tile.state == PZTileView.State.Moving {
            self.tile.touchesCancelled(touches, withEvent: event)
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.tile.state == PZTileView.State.Moving {
            let slider = self.superview as! UIScrollView
            slider.scrollEnabled = true
            self.tile.touchesEnded(touches, withEvent: event)
        }
    }
}