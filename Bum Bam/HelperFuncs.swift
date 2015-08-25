//
//  helperFuncs.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 06/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

func randomNumber(minX minX:UInt32, maxX:UInt32) -> Int {
    let result = (arc4random() % (maxX - minX + 1)) + minX
    return Int(result)
}

func delay(seconds: Double, after: () -> ()) {
    let delay = Int64(seconds * Double(NSEC_PER_SEC))
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, delay)
    dispatch_after(delayTime, dispatch_get_main_queue(),after)
}

extension CGRect {
    
    init(centerx: CGFloat,centery: CGFloat,width: CGFloat,height: CGFloat) {
        self.init(x: centerx - width / 2, y: centery - height / 2, width: width, height: height)
    }
    
}


func shuffleArray<T>(inout array: [T]) {
    
    for(var i = array.count-1; i != 0; --i) {
        let j = randomNumber(minX: UInt32(0), maxX: UInt32(i))
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
    
    for subview in settingsBlocks {
        subviews[subview.name] = MultiLayout(
            count: subview.subviewsCount,
            defaultHidden: false,
            createView: { (prntW, prntH) -> UIView in
                let view = SettingsBlockView(frame: CGRect(centerx: prntW*1.5, centery: prntH*0.5, width: prntW, height: prntW*settingsSquareSizeCoeff))
                view.contentSize = CGSize(width: max(prntW, prntW*settingsSquareSizeCoeff*CGFloat(subview.subviewsCount)+prntW*settingsMarginCoeff*2), height: prntW*settingsSquareSizeCoeff)
                view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                view.panGestureRecognizer.delaysTouchesBegan = view.delaysContentTouches
                view.name = subview.name
                return view
            },
            createSubview: { (id, count, prntW, prntH) -> UIView in
                let button = SettingsBlockButton()
                if count > 3 {
                    button.frame = CGRect(centerx: (id+0.5)*prntW*settingsSquareSizeCoeff+prntW*settingsMarginCoeff, centery: prntH*0.5, width: prntW*settingsImageSizeCoeff, height: prntW*settingsImageSizeCoeff)
                } else {
                    button.frame = CGRect(centerx: (id+0.5)*prntW*settingsSquareSizeCoeff+prntW*((1-settingsSquareSizeCoeff*count)/2), centery: prntH*0.5, width: prntW*settingsImageSizeCoeff, height: prntW*settingsImageSizeCoeff)
                }
                button.adjustsImageWhenHighlighted = false
                return button
            },
            subsubviews: [:]
        )
    }
    
    return Layout(
        createView: { (prntW, prntH) -> UIView in
            let view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
            view.userInteractionEnabled = true
            return view
        },
        subviews: [
            "blocks": Layout(subviews: subviews),
            "tempBackground": Layout(
                defaultHidden: true,
                createView: { (prntW, prntH) -> UIView in
                    let view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
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