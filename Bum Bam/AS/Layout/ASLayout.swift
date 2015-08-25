//
//  ASLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class ASLayout {
    
    
    var layout = Layout(
        subviews: [
            "background": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0,0,prntW,prntH))
                    view.image = UIImage(named: "backgroundGame")
                    return view
            }),
            "game": Layout(
                subviews: [
                    "touchArea": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIButton()
                            view.frame = CGRectMake(0, 0, prntW, prntH)
                            view.adjustsImageWhenHighlighted = false
                            return view
                    }),
                    "animal": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.5, width: prntW*0.8, height: prntW*0.8))
                            return view
                    }),
                    "tempAnimal": Layout(
                        defaultHidden: true,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*1.5, centery: prntH*0.5, width: prntW*0.8, height: prntW*0.8))
                            return view
                    })
                ])
        ]
    )
    
}