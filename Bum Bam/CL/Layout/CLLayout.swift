//
//  CLLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class CLLayout {
    
    
    var layout = Layout(
        subviews: [
            "background": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH/2, width: prntW, height: prntW*(16/9)) )
                    return view
            }),
            "game": Layout(
                subviews: [
                    "image": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = CLImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.4, width: prntW*0.9, height: prntW*0.9))
                            view.image = UIImage(named: "car")
                            view.userInteractionEnabled = true
                            return view
                    }),
                    "slider": MultiLayout(
                        count: CLConfig.colors.count,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIScrollView(frame: getSliderFrame(prntH*0.9))
                            view.contentSize = getSliderContentSize(CLConfig.colors.count)
                            view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                            view.panGestureRecognizer.delaysTouchesBegan = view.delaysContentTouches
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            var button = UIButton()
                            button.frame = getSliderSubviewFrame(count, id: id)
                            button.setSliderMask()
                            button.backgroundColor = CLConfig.colors[Int(id)]
                            button.adjustsImageWhenHighlighted = false
                            return button
                        },
                        subsubviews: [:])
                ])
        ]
    )
    
}