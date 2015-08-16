//
//  GuessShapeLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeLayout {
    
    
    var layout = Layout(
        subviews: [
            "settings": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.image = UIImage(named: "GuessShape-backgroundDefault")
                    view.userInteractionEnabled = true
                    return view
                },
                subviews: [
                    "blocks": GuessShapeHelper.createSettingsBlocksLayout(),
                    /*"selectShapeSet": MultiLayout(
                        count: GuessShapeConfigInstance.shapeSets.count,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var squareSize = (prntW-prntW*(168/1080))/3
                            var view = UIScrollView(frame: CGRect(centerx: prntW*1.5, centery: prntH*0.5, width: prntW, height: squareSize))
                            view.contentSize = CGSize(width: max(prntW, squareSize*CGFloat(GuessShapeConfigInstance.shapeSets.count)+prntW*(168/1080)), height: squareSize)
                            view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                            view.panGestureRecognizer.delaysTouchesBegan = view.delaysContentTouches
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            var squareSize = (prntW-prntW*(168/1080))/3
                            var imageSize = squareSize*(207/305)
                            var button = SelectShapeSetButton()
                            button.frame = CGRect(centerx: (id+0.5)*squareSize+prntW*(84/1080), centery: squareSize*0.5, width: imageSize, height: imageSize)
                            button.setImage(GuessShapeConfigInstance.shapeSets[Int(id)].settingsShapeSetImage!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), forState: .Normal)
                            button.adjustsImageWhenHighlighted = false
                            button.tintColor = UIColor(red: 182/255, green: 139/255, blue: 55/255, alpha: 1)
                            return button
                        },
                        subsubviews: [:]
                    ),
                    "selectDifficulty": MultiLayout(
                        count: 3,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIView(frame: CGRect(centerx: prntW*1.5, centery: prntH*0.5, width: prntW, height: (prntW-prntW*(168/1080))/3))
                            return view
                        }, createSubview: { (id, count, prntW, prntH) -> UIView in
                            var squareSize = (prntW-prntW*(168/1080))/3
                            var imageSize = squareSize*(207/305)
                            var button = SelectDifficultyButton()
                            button.frame = CGRect(centerx: (id+0.5)*squareSize+prntW*(84/1080), centery: squareSize*0.5, width: imageSize, height: imageSize)
                            button.adjustsImageWhenHighlighted = false
                            return button
                        }, subsubviews: [:]
                    ),*/
                    /*"playButton": Layout(
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var squareSize = (prntW-prntW*(168/1080))/3
                            var imageSize = squareSize*(207/305)*1.5
                            var button = UIButton()
                            button.frame = CGRect(centerx: prntW*1.5, centery: prntH*(3/4), width: imageSize, height: imageSize)
                            button.setImage(UIImage(named: "GuessShape-playButton")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
                            button.tintColor = UIColor.whiteColor()
                            button.adjustsImageWhenHighlighted = false
                            return button
                        }
                    ),*/
                    "tempBackground": Layout(
                        defaultHidden: true,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                            return view
                        }
                    )
                ]),
            
            "background": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.image = UIImage(named: "GuessShape-backgroundSettings")
                    return view
            }),
                
            "game": Layout(
                subviews: [
                    "siluette" : Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH*0.3, width: min(prntW, prntH)*0.6, height: min(prntW, prntH)*0.6))
                            view.image = UIImage(named: "GuessShape-goatSiluette")
                            return view
                    }),
                    "thumbCenter": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.5, centery: prntH-52, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-goat")
                            return view
                    }),
                    "thumbLeft": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.2, centery: prntH-52, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-dino")
                            return view
                    }),
                    "thumbRight": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.8, centery: prntH-52, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-giraffe")
                            return view
                    }),
                ]),
            
            "hud": Layout(
                subviews: [
                    "success": Layout(
                        defaultHidden: true, createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.5, width: prntW*0.5, height: prntW*0.5))
                            view.image = UIImage(named: "GuessShape-success")
                            return view
                    })
                ])
        ]
    )
}


