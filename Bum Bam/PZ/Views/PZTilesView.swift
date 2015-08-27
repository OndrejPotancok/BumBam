//
//  PZTilesView.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/26/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZTilesView: UIView {
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, withEvent: event)
        if hitView is PZTileView {
            if (hitView as! PZTileView).state != PZTileView.State.InSlider {
                return hitView
            }
        }
        return nil
    }
}