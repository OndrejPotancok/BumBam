//
//  TestLayoutAction.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class TestLayoutAction: TestDefaultLayoutAction {
    
    override func mainImageTouchesBegan() {
        self.layout["background"]?.view.backgroundColor = UIColor.yellowColor()
        (self.layout["game"]?["label"]?.view as! UILabel).text = "TEEST"
    }
    
}