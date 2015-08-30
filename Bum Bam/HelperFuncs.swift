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
        if i != j {swap(&array[j], &array[i])}
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

func getSliderFrame(centerY: CGFloat) -> CGRect {
    return CGRect(centerx: ScrnW*0.5, centery: centerY, width: ScrnW, height: ScrnW*sliderSquareSizeCoeff)
}
func getSliderContentSize(count: Int) -> CGSize {
    return CGSize(width: max(ScrnW, ScrnW*sliderSquareSizeCoeff*CGFloat(count)+ScrnW*slidersMarginCoeff*2), height: ScrnW*sliderSquareSizeCoeff)
}
func getSliderSubviewFrame(count: CGFloat, id: CGFloat) -> CGRect {
    if count > 3 {
        return CGRect(centerx: (id+0.5)*ScrnW*sliderSquareSizeCoeff+ScrnW*slidersMarginCoeff, centery: ScrnW*sliderSquareSizeCoeff*0.5, width: ScrnW*sliderSubviewSizeCoeff, height: ScrnW*sliderSubviewSizeCoeff)
    } else {
        return CGRect(centerx: (id+0.5)*ScrnW*sliderSquareSizeCoeff+ScrnW*((1-sliderSquareSizeCoeff*count)/2), centery: ScrnW*sliderSquareSizeCoeff*0.5, width: ScrnW*sliderSubviewSizeCoeff, height: ScrnW*sliderSubviewSizeCoeff)
    }
}
func getSliderContentOffset(subviewIndexInTheMiddle subviewIndex: Int) -> CGPoint{
    return CGPointMake((slidersMarginCoeff+sliderSquareSizeCoeff*(CGFloat(subviewIndex)+0.5)-0.5)*ScrnW,0)
}



func createSettingsLayout(settingsBlocks: [SettingsBlock]) -> Layout {
    
    var subviews = [String: Layout]()
    
    for subview in settingsBlocks {
        subviews[subview.name] = MultiLayout(
            count: subview.subviewsCount,
            defaultHidden: false,
            createView: { (prntW, prntH) -> UIView in
                let view = SettingsBlockView(frame: getSliderFrame(prntH*0.5))
                view.frame.origin.x += ScrnW
                view.contentSize = getSliderContentSize(subview.subviewsCount)
                view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                view.panGestureRecognizer.delaysTouchesBegan = view.delaysContentTouches
                view.name = subview.name
                return view
            },
            createSubview: { (id, count, prntW, prntH) -> UIView in
                let button = SettingsBlockButton()
                button.frame = getSliderSubviewFrame(count, id: id)
                button.adjustsImageWhenHighlighted = false
                button.backgroundColor = UIColor.whiteColor()
                
                /*let backgroundLayer = CALayer()
                backgroundLayer.frame = CGRectMake(10, 10, button.frame.width-20, button.frame.height-20)
                backgroundLayer.backgroundColor = UIColor.redColor().CGColor
                button.layer.addSublayer(backgroundLayer)*/
                
                button.layer.borderColor = UIColor.blackColor().CGColor
                button.layer.borderWidth = 2
                button.layer.cornerRadius = sliderCornerRadius
                button.layer.masksToBounds = true
                return button
            },
            subsubviews: [:]
        )
    }
    
    return Layout(
        createView: { (prntW, prntH) -> UIView in
            let view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH/2, width: prntW, height: prntW*(16/9)))
            view.userInteractionEnabled = true
            return view
        },
        subviews: [
            "blocks": Layout(subviews: subviews),
            "tempBackground": Layout(
                defaultHidden: true,
                createView: { (prntW, prntH) -> UIView in
                    let view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH/2, width: prntW, height: prntW*(16/9)))
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





