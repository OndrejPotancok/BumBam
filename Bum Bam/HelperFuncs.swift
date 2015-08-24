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

class SettingsBlock {
    var name: String
    var subviewsCount: Int
    
    init(name: String, subviewsCount: Int) {
        self.name = name
        self.subviewsCount = subviewsCount
    }
}

func createSettingsLayout(settingsBlocks: [SettingsBlock]) -> Layout {
    
    var subviews = [String: Layout]()
    
    var squareSizeCoeff: CGFloat = 912/3240
    var imageSizeCoeff: CGFloat = 874/4575
    var marginCoeff: CGFloat = (1-squareSizeCoeff*3)/2
    
    for subview in settingsBlocks {
        subviews[subview.name] = MultiLayout(
            count: subview.subviewsCount,
            defaultHidden: false,
            createView: { (prntW, prntH) -> UIView in
                var view = SettingsBlockView(frame: CGRect(centerx: prntW*1.5, centery: prntH*0.5, width: prntW, height: prntW*squareSizeCoeff))
                view.contentSize = CGSize(width: max(prntW, prntW*squareSizeCoeff*CGFloat(4)+prntW*marginCoeff*2), height: prntW*squareSizeCoeff)
                view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                view.panGestureRecognizer.delaysTouchesBegan = view.delaysContentTouches
                view.name = subview.name
                return view
            },
            createSubview: { (id, count, prntW, prntH) -> UIView in
                var button = SettingsBlockButton()
                if count > 3 {
                    button.frame = CGRect(centerx: (id+0.5)*prntW*squareSizeCoeff+prntW*marginCoeff, centery: prntH*0.5, width: prntW*imageSizeCoeff, height: prntW*imageSizeCoeff)
                } else {
                    button.frame = CGRect(centerx: (id+0.5)*prntW*squareSizeCoeff+prntW*((1-squareSizeCoeff*count)/2), centery: prntH*0.5, width: prntW*imageSizeCoeff, height: prntW*imageSizeCoeff)
                }
                button.adjustsImageWhenHighlighted = false
                return button
            },
            subsubviews: [:]
        )
    }
    
    return Layout(
        createView: { (prntW, prntH) -> UIView in
            var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
            view.userInteractionEnabled = true
            return view
        },
        subviews: [
            "blocks": Layout(subviews: subviews),
            "tempBackground": Layout(
                defaultHidden: true,
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                    return view
                }
            )
        ])
    
}

class ClosureClass {
    var execute: () -> ()
    init(closure: () -> ()) {
        self.execute = closure
    }
    func change(closure: () -> ()) {
        self.execute = closure
    }
}