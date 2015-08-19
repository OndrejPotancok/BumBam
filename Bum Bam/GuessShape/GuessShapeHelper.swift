//
//  GuessShapeHelper.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 11/08/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeHelper {
    
    struct SettingsBlock {
        var name: String
        var subviewsCount: Int
        
        init(name: String, subviewsCount: Int) {
            self.name = name
            self.subviewsCount = subviewsCount
        }
    }
    
    class func createSettingsBlocksLayout() -> Layout {
        
        var subviews = [String: Layout]()
        
        var squareSizeCoeff: CGFloat = 912/3240
        var imageSizeCoeff: CGFloat = 874/4575
        var marginCoeff: CGFloat = (1-squareSizeCoeff*3)/2
        
        for subview in GuessShapeConfig.defaultSettingsBlocks {
            subviews[subview.name] = MultiLayout(
                count: subview.subviewsCount,
                defaultHidden: false,
                createView: { (prntW, prntH) -> UIView in
                    var view = GuessShapeSettingsBlockView(frame: CGRect(centerx: prntW*1.5, centery: prntH*0.5, width: prntW, height: prntW*squareSizeCoeff))
                    view.contentSize = CGSize(width: max(prntW, prntW*squareSizeCoeff*CGFloat(GuessShapeConfig.shapeSets.count)+prntW*marginCoeff*2), height: prntW*squareSizeCoeff)
                    view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                    view.panGestureRecognizer.delaysTouchesBegan = view.delaysContentTouches
                    view.name = subview.name
                    return view
                },
                createSubview: { (id, count, prntW, prntH) -> UIView in
                    var button = GuessShapeSettingsBlockButton()
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
        
        return Layout(subviews: subviews)
        
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
    
}

































