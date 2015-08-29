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
            self.createOrderInSliderArray()
        }
    }
    var orderInSlider: [Int]!
    
    var difficulty: Int! {
        didSet {
            self.createVisibleTilesArray()
        }
    }
    var visibleTiles = Set<Int>()
    
    func getImage(index: Int) -> UIImage? {
        let id = index+1
        var indexString = ""
        if id<10 {indexString += "0"}
        indexString += "\(id)"
        return UIImage(named: "\(PZConfig.puzzleImages[self.puzzleImageID].name)_\(self.count)_\(indexString)")
    }
    func getGrayImage(index: Int) -> UIImage? {
        let id = index+1
        var indexString = ""
        if id<10 {indexString += "0"}
        indexString += "\(id)"
        return UIImage(named: "\(PZConfig.puzzleImages[self.puzzleImageID].name)_g_\(self.count)_\(indexString)")
    }
    
    func createOrderInSliderArray() {
        self.orderInSlider = []
        for index in 0..<self.count {
            self.orderInSlider.append(index)
        }
        shuffleArray(&self.orderInSlider!)
    }
    func createVisibleTilesArray() {
        self.visibleTiles.removeAll()
        if self.difficulty == 2 {
            return
        }
        if self.difficulty == 0 {
            for index in 0..<self.count {
                self.visibleTiles.insert(index)
            }
            return
        }
        let rowCount = Int(sqrt(Double(count)))
        var arr = [Int]()
        for index in 0..<rowCount {
            arr.append(index)
        }
        shuffleArray(&arr)
        for (row, column) in arr.enumerate() {
            self.visibleTiles.insert(row*rowCount+column)
        }
    }
    
    
}







