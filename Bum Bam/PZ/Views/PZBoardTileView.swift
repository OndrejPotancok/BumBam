//
//  PZBoardTileView.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/26/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZBoardTileView: UIImageView, subviewOfMultiLayout {
    
    var index: Int!
    
    var _tileView: PZTileView?
    var tileView: PZTileView? {
        get {
            if self._tileView != nil {
                let tileViewFrameOrigin = self._tileView!.superview!.convertPoint(self._tileView!.frame.origin, toView: self.superview!)
                if round(self.frame.origin.x) != round(tileViewFrameOrigin.x) || round(self.frame.origin.y) != round(tileViewFrameOrigin.y) {
                    self._tileView = nil
                }
            }
            return _tileView
        }
        set {
            self._tileView = newValue
        }
    }

    
}