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
        let _settingsBackgroundImageName: String!
                var settingsBackgroundImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._settingsBackgroundImageName
                }
                var settingsBackgroundImage: UIImage? {
                    return UIImage(named: self.settingsBackgroundImageName)
                }
        
        
        let _settingsShapeSetImageName: String
                var settingsShapeSetImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._settingsShapeSetImageName
                }
                var settingsShapeSetImage: UIImage? {
                    return UIImage(named: self.settingsShapeSetImageName)
                }
        
        
        let color: UIColor!
        
        
        let shapeSubSets: [ShapeSubSet]!
        
        init(settingsBackgroundImageName: String!, settingsShapeSetImageName: String!, color: UIColor!, shapeSubSets: [ShapeSubSet]) {
            self._settingsBackgroundImageName = settingsBackgroundImageName
            self._settingsShapeSetImageName = settingsShapeSetImageName
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
        let _gameBackgroundImageName: String
                var gameBackgroundImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._gameBackgroundImageName
                }
                var gameBackgroundImage: UIImage? {
                    return UIImage(named: self.gameBackgroundImageName)
                }
        
        
        let _settingsBackgroundImageName: String
                var settingsBackgroundImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._settingsBackgroundImageName
                }
                var settingsBackgroundImage: UIImage? {
                    return UIImage(named: self.settingsBackgroundImageName)
                }
        
        
        let _settingsShapeSubSetImageName: String!
                var settingsShapeSubSetImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._settingsShapeSubSetImageName
                }
                var settingsShapeSubSetImage: UIImage? {
                    return UIImage(named: self.settingsShapeSubSetImageName)
                }
        
        
        let _settingsDifficultyImageNames: [String]
                var settingsDifficultyImageNames: [String] {
                    var settingsDifficultyImageNames = [String]()
                    for settingsDifficultyImageName in self._settingsDifficultyImageNames {
                        settingsDifficultyImageNames.append(GuessShapeConfig.imageNamesPrefix + settingsDifficultyImageName)
                    }
                    return settingsDifficultyImageNames
                }
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
            self._gameBackgroundImageName = gameBackgroundImageName
            self._settingsBackgroundImageName = settingsBackgroundImageName
            self._settingsShapeSubSetImageName = settingsShapeSubSetImageName
            self._settingsDifficultyImageNames = settingsDifficultyImageNames
            self.color = color
            self.shapes = shapes
        }
    }
    struct Shape {
        let _thumbImageName: String
                var thumbImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._thumbImageName
                }
                var thumbImage: UIImage? {
                    return UIImage(named: self.thumbImageName)
                }
        
        
        let _siluetteImageName: String
                var siluetteImageName: String {
                    return GuessShapeConfig.imageNamesPrefix + self._siluetteImageName
                }
                var siluetteImage: UIImage? {
                    return UIImage(named: self.siluetteImageName)
                }
        
        
        init(thumbImageName: String, siluetteImageName: String) {
            self._thumbImageName = thumbImageName
            self._siluetteImageName = siluetteImageName
        }
    }

    
    
}

































