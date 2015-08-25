//
//  GuessShapeHelper.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 11/08/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeHelper {

    struct ShapeSet {
        let settingsBackgroundImageName: String!
                var settingsBackgroundImage: UIImage? {
                    return UIImage(named: self.settingsBackgroundImageName)
                }
        
        
        let settingsShapeSetImageName: String
                var settingsShapeSetImage: UIImage? {
                    return UIImage(named: self.settingsShapeSetImageName)
                }
        
        
        let color: UIColor!
        
        
        let shapeSubSets: [ShapeSubSet]!
        
        init(settingsBackgroundImageName: String!, settingsShapeSetImageName: String!, color: UIColor!, shapeSubSets: [ShapeSubSet]) {
            self.settingsBackgroundImageName = settingsBackgroundImageName
            self.settingsShapeSetImageName = settingsShapeSetImageName
            self.color = color
            self.shapeSubSets = shapeSubSets
        }
        init(gameBackgroundImageName: String, settingsBackgroundImageName: String, settingsShapeSetImageName: String, settingsDifficultyImageNames: [String], color: UIColor, shapes: [String:[Shape]]) {
            self.init(
                settingsBackgroundImageName: nil,
                settingsShapeSetImageName: settingsShapeSetImageName,
                color: nil,
                shapeSubSets: [
                    ShapeSubSet(
                        gameBackgroundImageName: gameBackgroundImageName,
                        settingsBackgroundImageName: settingsBackgroundImageName,
                        settingsShapeSubSetImageName: nil,
                        settingsDifficultyImageNames: settingsDifficultyImageNames,
                        color: color,
                        shapes: shapes
                    )
                ]
            )
        }
    }
    
    
    
    
    struct ShapeSubSet {
        let gameBackgroundImageName: String
                var gameBackgroundImage: UIImage? {
                    return UIImage(named: self.gameBackgroundImageName)
                }
        
        
        let settingsBackgroundImageName: String
                var settingsBackgroundImage: UIImage? {
                    return UIImage(named: self.settingsBackgroundImageName)
                }
        
        
        let settingsShapeSubSetImageName: String!
                var settingsShapeSubSetImage: UIImage? {
                    return UIImage(named: self.settingsShapeSubSetImageName)
                }
        
        
        let settingsDifficultyImageNames: [String]
                var settingsDifficultyImages: [UIImage?] {
                    var settingsDifficultyImages = [UIImage?]()
                    for settingsDifficultyImageName in self.settingsDifficultyImageNames {
                        settingsDifficultyImages.append(UIImage(named: settingsDifficultyImageName))
                    }
                    return settingsDifficultyImages
                }
        
        
        let color: UIColor
        
        
        let shapes: [String:[Shape]]
        
        
        init(gameBackgroundImageName: String, settingsBackgroundImageName: String, settingsShapeSubSetImageName: String!, settingsDifficultyImageNames: [String], color: UIColor, shapes: [String:[Shape]]) {
            self.gameBackgroundImageName = gameBackgroundImageName
            self.settingsBackgroundImageName = settingsBackgroundImageName
            self.settingsShapeSubSetImageName = settingsShapeSubSetImageName
            self.settingsDifficultyImageNames = settingsDifficultyImageNames
            self.color = color
            self.shapes = shapes
        }
    }
    struct Shape {
        let thumbImageName: String
                var thumbImage: UIImage? {
                    return UIImage(named: self.thumbImageName)
                }
        
        
        let siluetteImageName: String
                var siluetteImage: UIImage? {
                    return UIImage(named: self.siluetteImageName)
                }
        
        
        init(thumbImageName: String, siluetteImageName: String) {
            self.thumbImageName = thumbImageName
            self.siluetteImageName = siluetteImageName
        }
    }

    
    
}

































