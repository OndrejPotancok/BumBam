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
            "settings": createSettingsLayout(GuessShapeConfig.defaultSettingsBlocks),
            
            "background": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.image = UIImage(named: "backgroundSettings")
                    return view
            }),
                
            "game": Layout(
                subviews: [
                    "siluette" : Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH*0.3, width: min(prntW, prntH)*0.6, height: min(prntW, prntH)*0.6))
                            return view
                    }),
                    "thumbCenter": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.5, centery: prntH-52, width: 100, height: 100))
                            return view
                    }),
                    "thumbLeft": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.2, centery: prntH-52, width: 100, height: 100))
                            return view
                    }),
                    "thumbRight": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.8, centery: prntH-52, width: 100, height: 100))
                            return view
                    }),
                ]),
            
            "hud": Layout(
                subviews: [
                    "success": Layout(
                        defaultHidden: true, createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.5, width: prntW*0.5, height: prntW*0.5))
                            view.image = UIImage(named: "success")
                            return view
                    })
                ])
        ]
    )
}


