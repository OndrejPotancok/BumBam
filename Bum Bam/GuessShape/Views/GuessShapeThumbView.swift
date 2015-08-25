//
//  GuessShapeThumbView.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 09/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

protocol PGuessShapeThumbViewDelegate : class {
    
    func thumbDragBegan(sender sender: GuessShapeThumbView)
    func thumbDragMoved(sender sender: GuessShapeThumbView)
    func thumbDragEnded(sender sender: GuessShapeThumbView)
    
}

class GuessShapeThumbView: UIImageView {
    
    weak var delegate: PGuessShapeThumbViewDelegate!
    
    var shapeName: String!
    
    var defaultFrame: CGRect
    
    var xTouchOffset: CGFloat = 0
    var yTouchOffset: CGFloat = 0
    
    override init(frame: CGRect) {
        
        self.defaultFrame = frame
        
        super.init(frame: frame)

        self.userInteractionEnabled = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first{
            let point = touch.locationInView(self.superview)
            self.xTouchOffset = point.x - self.center.x
            self.yTouchOffset = point.y - self.center.y
        }
        
        self.delegate.thumbDragBegan(sender: self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if let touch = touches.first {
            let point = touch.locationInView(self.superview)
            self.center.x = point.x - self.xTouchOffset
            self.center.y = point.y - self.yTouchOffset
        }
        
        self.delegate.thumbDragMoved(sender: self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchesMoved(touches, withEvent: event)
        
        self.delegate.thumbDragEnded(sender: self)
    }
    
    func returnToDefaultPosition(animationDuration animationDuration: NSTimeInterval) {
        
        if animationDuration == 0 {
            self.frame = self.defaultFrame
        }
        else {
            UIView.animateWithDuration(animationDuration, delay: 0, options: .CurveEaseOut, animations: {
                self.frame = self.defaultFrame
            }, completion: nil)
        }
        
    }
    
}








