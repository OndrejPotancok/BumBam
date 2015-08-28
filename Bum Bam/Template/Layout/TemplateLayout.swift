//
//  TemplateLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class TemplateLayout {
    
    
    var layout = Layout(
        subviews: [
            "background": Layout(
            createView: { (prntW, prntH) -> UIView in
            var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH/2, width: prntW, height: prntW*(16/9)) )
            return view
            }),
            "game": Layout()
        ]
    )
    
}