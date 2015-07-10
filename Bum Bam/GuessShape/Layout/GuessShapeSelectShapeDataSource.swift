//
//  GuessShapeSelectShapeDataSource.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 10/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeSelectShapeDataSource: AKPickerViewDataSource {
    
    private weak var config: GuessShapeConfig! = GuessShapeConfigInstance
    
    @objc func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        return self.config.shapesToSelectImageNames.count
    }
    
    @objc func pickerView(pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        return UIImage(named: self.config.imageNamesPrefix + self.config.shapesToSelectImageNames[item])!
    }
    
}
var GuessShapeSelectShapeDataSourceInstance = GuessShapeSelectShapeDataSource()