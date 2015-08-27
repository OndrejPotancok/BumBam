//
//  PZConfig.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 10/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZConfig {
    
    static let sliderSquareSizeCoeff: CGFloat = 1/3
    static let tileSizeCoeff: CGFloat = 0.8 * PZConfig.sliderSquareSizeCoeff
    
    static let defaultSettingsBlocks: [SettingsBlock] = [
        SettingsBlock(name: "selectPuzzleImage", subviewsCount: PZConfig.puzzleImages.count),
        SettingsBlock(name: "selectDifficulty", subviewsCount: 3),
        SettingsBlock(name: "playButton", subviewsCount: 1)
    ]
    
    static let puzzleImages: [PZHelper.PuzzleImage] = [
        PZHelper.PuzzleImage(name: "puzzle1", variations: [9], backgroundImageName: ""),
        PZHelper.PuzzleImage(name: "slon", variations: [4,9,16], backgroundImageName: "backgroundGame")
    ]
    
}