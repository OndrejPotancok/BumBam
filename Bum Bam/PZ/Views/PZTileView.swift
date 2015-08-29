//
//  PZTileView.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/26/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

protocol PPZTileViewDelegate: class {
    func getBoardTileView(point: CGPoint) -> PZBoardTileView?
    func checkForSuccess() -> Bool
}

class PZTileView: UIImageView, subviewOfMultiLayout {
    
    weak var delegate: PPZTileViewDelegate!
    
    var index: Int!
    
    var tileHelperToWatch: PZTileHelperView?
    
    var state: State = State.InSlider {
        didSet {
            self.stateChanged()
        }
    }
    
    var indexOnBoard: Int!
    
    var movingOffsetX: CGFloat = 0
    var movingOffsetY: CGFloat = 0
    
    enum State {
        case InSlider
        case Moving
        case OnBoard
        
        
    }
    
    func stateChanged() {
        switch self.state {
        case .InSlider:
            self.userInteractionEnabled = false
            self.layer.shadowOpacity = 0
            self.setSliderMask()
            //self.layer.borderWidth = 0
        case .Moving:
            self.userInteractionEnabled = true
            self.layer.shadowPath = UIBezierPath(rect: self.bounds).CGPath
            self.layer.shadowOpacity = 1
            self.layer.mask = nil
            //self.layer.borderWidth = 0
        case .OnBoard:
            self.userInteractionEnabled = true
            self.layer.shadowOpacity = 0
            self.layer.mask = nil
            //self.layer.borderWidth = 1
        }
    }
    
    func updateInSlider() {
        guard self.state == State.InSlider else {return}
        guard let helperView = self.tileHelperToWatch else {return}
        self.frame.origin = helperView.superview!.convertPoint(helperView.frame.origin, toView: self.superview)
        self.frame.size = helperView.frame.size
    }
    
    func hideToSlider() {
        guard self.state != State.InSlider else {return}
        guard let helperView = self.tileHelperToWatch else {return}
        let slider = helperView.superview! as! UIScrollView
        let tempSliderContentOffset = slider.contentOffset
        var newSliderContentOffset: CGPoint
        let oldTileOrigin = helperView.superview!.convertPoint(helperView.frame.origin, toView: self.superview)
        if oldTileOrigin.x < ScrnW/3 {
            newSliderContentOffset = getSliderContentOffset(subviewIndexInTheMiddle: helperView.index+1)
        } else if oldTileOrigin.x + helperView.bounds.width > ScrnW*(2/3) {
            newSliderContentOffset = getSliderContentOffset(subviewIndexInTheMiddle: helperView.index-1)
        } else {
            newSliderContentOffset = getSliderContentOffset(subviewIndexInTheMiddle: helperView.index)
        }
        
        slider.contentOffset = newSliderContentOffset
        let newTileOrigin = helperView.superview!.convertPoint(helperView.frame.origin, toView: self.superview)
        slider.contentOffset = tempSliderContentOffset
        slider.setContentOffset(newSliderContentOffset, animated: true)
        UIView.animateWithDuration(0.3, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            self.frame.origin = newTileOrigin
            self.frame.size = helperView.frame.size
            }) { (finished) -> Void in
                self.state = .InSlider
                self.updateInSlider()
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self.superview) {
            if self.state == State.InSlider {
                self.movingOffsetX = 0
                self.movingOffsetY = 0
            } else {
                self.movingOffsetX = point.x - self.center.x
                self.movingOffsetY = point.y - self.center.y
            }
            self.state = State.Moving
            self.superview?.bringSubviewToFront(self)
            self.touchesMoved(touches, withEvent: event)
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard self.state == State.Moving else {return}
        if let point = touches.first?.locationInView(self.superview) {
            self.center = CGPointMake(point.x-self.movingOffsetX, point.y-self.movingOffsetY)
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard self.state == State.Moving else {return}
        if let _ = touches.first?.locationInView(self.superview) {
            if let boardTileView = self.delegate.getBoardTileView(self.center) {
                if boardTileView.tileView != nil && boardTileView.tileView != self {
                    boardTileView.tileView!.hideToSlider()
                }
                boardTileView.tileView = self
                UIView.animateWithDuration(0.15, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
                    self.frame.origin = boardTileView.superview!.convertPoint(boardTileView.frame.origin, toView: self.superview)
                    self.frame.size = boardTileView.frame.size
                    }) { (finished) -> Void in
                        self.delegate.checkForSuccess()
                }
                self.state = State.OnBoard
            } else {
                self.hideToSlider()
            }
            
        }
    }
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        guard touches != nil else {return}
        self.touchesEnded(touches!, withEvent: event)
    }
    
}






