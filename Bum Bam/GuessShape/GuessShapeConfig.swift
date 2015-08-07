//
//  GuessShapeConfig.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 10/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeConfig {
    
    var thumbReturningAnimationDuration: NSTimeInterval = 0.3
    var thumbToSiluetteAnimationDuration: NSTimeInterval = 0.3
    var delayAfterSuccess: Double = 1
    
    
    var imageNamesPrefix = "GuessShape-"
    struct ShapeSet {
        let _gameBackgroundImageName: String
        var gameBackgroundImageName: String {
            return GuessShapeConfigInstance.imageNamesPrefix + self._gameBackgroundImageName
        }
        var gameBackgroundImage: UIImage? {
            return UIImage(named: self.gameBackgroundImageName)
        }
        
        let _settingsBackgroundImageName: String
        var settingsBackgroundImageName: String {
            return GuessShapeConfigInstance.imageNamesPrefix + self._settingsBackgroundImageName
        }
        var settingsBackgroundImage: UIImage? {
            return UIImage(named: self.settingsBackgroundImageName)
        }
        
        let _settingsShapeSetImageName: String
        var settingsShapeSetImageName: String {
            return GuessShapeConfigInstance.imageNamesPrefix + self._settingsShapeSetImageName
        }
        var settingsShapeSetImage: UIImage? {
            return UIImage(named: self.settingsShapeSetImageName)
        }
        
        let _settingsDifficultyImageNames: [String]
        var settingsDifficultyImageNames: [String] {
            var settingsDifficultyImageNames = [String]()
            for settingsDifficultyImageName in self._settingsDifficultyImageNames {
                settingsDifficultyImageNames.append(GuessShapeConfigInstance.imageNamesPrefix + settingsDifficultyImageName)
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
        
        init(gameBackgroundImageName: String, settingsBackgroundImageName: String, settingsShapeSetImageName: String, settingsDifficultyImageNames: [String], color: UIColor, shapes: [String:[Shape]]) {
            self._gameBackgroundImageName = gameBackgroundImageName
            self._settingsBackgroundImageName = settingsBackgroundImageName
            self._settingsShapeSetImageName = settingsShapeSetImageName
            self._settingsDifficultyImageNames = settingsDifficultyImageNames
            self.color = color
            self.shapes = shapes
        }
    }
    struct Shape {
        let _thumbImageName: String
        var thumbImageName: String {
            return GuessShapeConfigInstance.imageNamesPrefix + self._thumbImageName
        }
        var thumbImage: UIImage? {
            return UIImage(named: self.thumbImageName)
        }
        
        let _siluetteImageName: String
        var siluetteImageName: String {
            return GuessShapeConfigInstance.imageNamesPrefix + self._siluetteImageName
        }
        var siluetteImage: UIImage? {
            return UIImage(named: self.siluetteImageName)
        }
        
        init(thumbImageName: String, siluetteImageName: String) {
            self._thumbImageName = thumbImageName
            self._siluetteImageName = siluetteImageName
        }
    }
    
    var shapeSets: [ShapeSet] = [
        ShapeSet(
            gameBackgroundImageName: "backgroundGame",
            settingsBackgroundImageName: "backgroundCars",
            settingsShapeSetImageName: "gameIconCars",
            settingsDifficultyImageNames: [
                "diffEasy",
                "diffMedium",
                "diffHard"
            ],
            color: UIColor(red: 26/255, green: 31/255, blue: 77/255, alpha: 1),
            shapes: [
                "easy": [
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluette"),
                    Shape(thumbImageName: "dino", siluetteImageName: "dinoSiluette"),
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette")
                ],
                "medium": [
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "dino", siluetteImageName: "dinoSiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette")
                ],
                "hard": [
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluette"),
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette")
                ]
            ]
        ),
        ShapeSet(
            gameBackgroundImageName: "backgroundGame",
            settingsBackgroundImageName: "backgroundShapes",
            settingsShapeSetImageName: "gameIconShapes",
            settingsDifficultyImageNames: [
                "diffEasy",
                "diffMedium",
                "diffHard"
            ],
            color: UIColor(red: 6/255, green: 71/255, blue: 9/255, alpha: 1),
            shapes: [
                "easy": [
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette")
                ],
                "medium": [
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluette")
                ],
                "hard": [
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette")
                ]
            ]
        ),
        ShapeSet(
            gameBackgroundImageName: "backgroundGame",
            settingsBackgroundImageName: "backgroundAnimals",
            settingsShapeSetImageName: "gameIconAnimals",
            settingsDifficultyImageNames: [
                "diffMedium",
                "diffEasy",
                "diffHard"
            ],
            color: UIColor(red: 115/255, green: 51/255, blue: 51/255, alpha: 1),
            shapes: [
                "easy": [
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette")
                ],
                "medium": [
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluette")
                ],
                "hard": [
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette")
                ]
            ]
        ),
        ShapeSet(
            gameBackgroundImageName: "backgroundGame",
            settingsBackgroundImageName: "backgroundAnimals",
            settingsShapeSetImageName: "gameIconAnimals",
            settingsDifficultyImageNames: [
                "diffEasy",
                "diffMedium",
                "diffHard"
            ],
            color: UIColor(red: 115/255, green: 51/255, blue: 51/255, alpha: 1),
            shapes: [
                "easy": [
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette")
                ],
                "medium": [
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluette")
                ],
                "hard": [
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette"),
                    Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette")
                ]
            ]
        )
        
    ]
}

    var GuessShapeConfigInstance: GuessShapeConfig = GuessShapeConfig()