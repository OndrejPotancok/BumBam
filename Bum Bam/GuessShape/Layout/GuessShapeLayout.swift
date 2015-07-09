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
            "settings": Layout(),
            "background": Layout(createView: { (prntW, prntH) -> UIView in
                var view = UIView(frame: CGRectMake(0, 0, prntW, prntH))
                view.backgroundColor = UIColor.greenColor()
                return view
            }),
            "game": Layout(subviews: [
                "siluette" : Layout(createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH/3, width: min(prntW, prntH)*0.6, height: min(prntW, prntH)*0.6))
                    view.image = UIImage(named: "GuessShapeCow")
                    return view
                })
                ])
        ]
    )
    
}