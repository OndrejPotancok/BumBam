//
//  TestMainImageView.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

protocol PTestMainImageViewDelegate : class {
    
    func mainImagetouchesBegan()
    
}

class TestMainImageView: UIImageView {
    
    weak var delegate: PTestMainImageViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.userInteractionEnabled = true
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.delegate.mainImagetouchesBegan()
    }
    
}