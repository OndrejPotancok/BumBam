//
//  PZHelper.swift
//  Bum Bam
//
//  Created by Ondrej Potancok on 8/27/15.
//  Copyright © 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZHelper {
    
    
    class PuzzleImage {
        let name: String
        let variations: [Int]
        let backgroundImageName: String
        
        init(name: String, variations: [Int], backgroundImageName: String) {
            self.name = name
            self.variations = variations
            self.backgroundImageName = backgroundImageName
        }
    }
    
}