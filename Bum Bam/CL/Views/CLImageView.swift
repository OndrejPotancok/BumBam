//
//  CLImageView.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/27/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class CLImageView: UIImageView {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let point = touches.first?.locationInView(self) {
            
            let newImage = self.image?.floodFillFromPoint(CGPointMake(point.x*(973/self.bounds.width), point.y*(973/self.bounds.height)), withColor: UIColor.redColor(), andTolerance: 0)
            self.image = newImage
        }
    }
    
}