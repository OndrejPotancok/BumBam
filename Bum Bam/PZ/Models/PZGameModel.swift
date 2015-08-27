//
//  PZModel.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZGameModel: MainGameModel {
    
    var puzzleImageID: Int!
    var count: Int! {
        didSet {
            self.createOrderInSlider()
        }
    }
    var orderInSlider: [Int]!
    
    func getImage(index: Int) -> UIImage? {
        return UIImage(named: "\(PZConfig.puzzleImages[self.puzzleImageID].name)_\(self.count)_\(index)")
    }
    func getGrayImage(index: Int) -> UIImage? {
        return UIImage(named: "\(PZConfig.puzzleImages[self.puzzleImageID].name)_\(self.count)_\(index)_g")
    }
    
    func createOrderInSlider() {
        self.orderInSlider = []
        for index in 0..<self.count {
            self.orderInSlider.append(index)
        }
        shuffleArray(&self.orderInSlider!)
    }
    
    
}