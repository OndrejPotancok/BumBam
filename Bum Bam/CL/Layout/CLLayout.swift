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
            "background": Layout(),
            "game": Layout(
                subviews: [
                    "image": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = CLImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.5, width: prntW*0.9, height: prntW*0.9))
                            view.image = UIImage(named: "car")
                            view.userInteractionEnabled = true
                            return view
                    })
                ])
        ]
    )
    
}