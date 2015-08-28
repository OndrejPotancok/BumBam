//
//  CLImageView.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/27/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

protocol PCLImageViewDelegate: class {
    func getCurrentColor() -> UIColor?
}

class CLImageView: UIImageView {
    
    weak var delegate: PCLImageViewDelegate!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let image = self.image else {return}
        if let point = touches.first?.locationInView(self) {
            let cgimage = image.CGImage
            let imageWidth = CGImageGetWidth(cgimage)
            let imageHeight = CGImageGetHeight(cgimage)
            if let newImage = image.floodFillFromPoint(CGPointMake(point.x*(CGFloat(imageWidth)/self.bounds.width), point.y*(CGFloat(imageHeight)/self.bounds.height)), withColor: self.delegate.getCurrentColor(), andTolerance: 0) {
                self.image = newImage
            }
        }
    }
    
}