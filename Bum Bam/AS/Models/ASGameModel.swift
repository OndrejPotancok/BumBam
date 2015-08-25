//
//  ASModel.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class ASGameModel: MainGameModel {
    
    var animalIndex: Int!
    var nextAnimalIndex: Int!
    
    override func set() {
        if self.nextAnimalIndex == nil {
            self.animalIndex = randomNumber(minX: 0, maxX: UInt32(ASConfig.animals.count-1))
        } else {
            self.animalIndex = self.nextAnimalIndex
        }
        var index = randomNumber(minX: 0, maxX: UInt32(ASConfig.animals.count-2))
        if index >= self.animalIndex {index = index + 1}
        self.nextAnimalIndex = index % ASConfig.animals.count
    }
}