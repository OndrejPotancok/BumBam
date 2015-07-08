//
//  TestLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class TestLayout {
    
    var layout =
    Layout(subviews: [
        "settings": Layout(
            subviews: [
                "text": Layout(
                    createView: { (prntW, prntH) -> UIView in
                        var txtField: UITextField = UITextField()
                        txtField.frame = CGRect(centerx: prntW/2, centery: prntH*0.3, width: 200, height: 20)
                        println(prntW)
                        println(prntH)
                        println(txtField.frame)
                        txtField.backgroundColor = UIColor.grayColor()
                        return txtField
                }),
                "startGameButton": Layout(
                    
                    createView: { (prntW, prntH) -> UIView in
                        let button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
                        button.frame = CGRect(centerx: prntW/2, centery: prntH-400, width: 100, height: 50)
                        button.backgroundColor = UIColor.greenColor()
                        button.setTitle("START GAME", forState: UIControlState.Normal)
                        return button
                }),
            ]),
        "background" : Layout(
            defaultHidden: true,
            createView: { (prntW, prntH) -> UIView in
                let view = UIView(frame: fullscreen)
                view.backgroundColor = UIColor.brownColor()
                return view
        }),
        "game" : Layout(
            defaultHidden: true,
            subviews: [
                "label" : Layout(
                    createView: { (prntW, prntH) -> UIView in
                        var label = UILabel(frame: CGRectMake(0, 0, 200, 21))
                        label.center = CGPointMake(160, 284)
                        label.textAlignment = NSTextAlignment.Center
                        label.text = "I'am a test label"
                        return label
                }),
                "mainImage" : Layout(
                    defaultHidden: true,
                    createView: { (prntW, prntH) -> UIView in
                        var imageView = TestMainImageView(frame: CGRect(centerx: prntW*0.8, centery: prntH*0.8, width: 100, height: 100))
                        imageView.image = UIImage(named: "cow")
                        return imageView
                }),
                "row" : MultiLayout(
                    count: 3,
                    defaultHidden: false,
                    createView: { (prntW, prntH) -> UIView in
                        var view = UIView(frame: CGRect(centerx: 150, centery: prntH-50, width: 300, height: 100))
                        return view
                },
                    createSubview: { (id, count, prntW, prntH) -> UIView in
                        var imageView = UIImageView(frame: CGRectMake(id * (prntW / count), 0, prntW / count, prntH))
                        imageView.image = UIImage(named: "cow")
                        return imageView
                    }, subsubviews: [:])
            ])
        ]
    )
    
}