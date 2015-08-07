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
                    Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteEasy"),
                    Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteEasy"),
                    Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteEasy"),
                    Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteEasy"),
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteEasy"),
                    Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteEasy"),
                    Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteEasy"),
                    Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteEasy"),
                    Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteEasy"),
                    Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteEasy"),
                    Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteEasy"),
                    Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteEasy"),
                    Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteEasy"),
                    Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteEasy"),
                    Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteEasy"),
                    Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteEasy"),
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteEasy"),
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteEasy"),
                    Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteEasy"),
                    Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteEasy"),
                    Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteEasy"),
                    Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteEasy"),
                    Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteEasy"),
                    Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteEasy"),
                    Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteEasy"),
                    Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteEasy"),
                    Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteEasy"),
                    Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteEasy"),
                    Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteEasy"),
                    Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteEasy"),
                    Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteEasy"),
                    Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteEasy"),
                    Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteEasy"),
                    Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteEasy"),
                    Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteEasy"),
                    Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteEasy"),
                    Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteEasy"),
                    Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteEasy"),
                    Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteEasy"),
                    Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteEasy"),
                    Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteEasy"),
                    Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteEasy"),
                    Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteEasy"),
                    Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteEasy"),
                    Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteEasy"),
                    Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteEasy"),
                    Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteEasy"),
                    Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteEasy"),
                    Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteEasy"),
                    Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteEasy")
                ],
                "medium": [
                    Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteMedium"),
                    Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteMedium"),
                    Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteMedium"),
                    Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteMedium"),
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteMedium"),
                    Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteMedium"),
                    Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteMedium"),
                    Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteMedium"),
                    Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteMedium"),
                    Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteMedium"),
                    Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteMedium"),
                    Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteMedium"),
                    Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteMedium"),
                    Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteMedium"),
                    Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteMedium"),
                    Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteMedium"),
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteMedium"),
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteMedium"),
                    Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteMedium"),
                    Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteMedium"),
                    Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteMedium"),
                    Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteMedium"),
                    Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteMedium"),
                    Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteMedium"),
                    Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteMedium"),
                    Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteMedium"),
                    Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteMedium"),
                    Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteMedium"),
                    Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteMedium"),
                    Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteMedium"),
                    Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteMedium"),
                    Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteMedium"),
                    Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteMedium"),
                    Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteMedium"),
                    Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteMedium"),
                    Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteMedium"),
                    Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteMedium"),
                    Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteMedium"),
                    Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteMedium"),
                    Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteMedium"),
                    Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteMedium"),
                    Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteMedium"),
                    Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteMedium"),
                    Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteMedium"),
                    Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteMedium"),
                    Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteMedium"),
                    Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteMedium"),
                    Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteMedium"),
                    Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteMedium"),
                    Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteMedium")
                ],
                "hard": [
                    Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteHard"),
                    Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteHard"),
                    Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteHard"),
                    Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteHard"),
                    Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteHard"),
                    Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteHard"),
                    Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteHard"),
                    Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteHard"),
                    Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteHard"),
                    Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteHard"),
                    Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteHard"),
                    Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteHard"),
                    Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteHard"),
                    Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteHard"),
                    Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteHard"),
                    Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteHard"),
                    Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteHard"),
                    Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteHard"),
                    Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteHard"),
                    Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteHard"),
                    Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteHard"),
                    Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteHard"),
                    Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteHard"),
                    Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteHard"),
                    Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteHard"),
                    Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteHard"),
                    Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteHard"),
                    Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteHard"),
                    Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteHard"),
                    Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteHard"),
                    Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteHard"),
                    Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteHard"),
                    Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteHard"),
                    Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteHard"),
                    Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteHard"),
                    Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteHard"),
                    Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteHard"),
                    Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteHard"),
                    Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteHard"),
                    Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteHard"),
                    Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteHard"),
                    Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteHard"),
                    Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteHard"),
                    Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteHard"),
                    Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteHard"),
                    Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteHard"),
                    Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteHard"),
                    Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteHard"),
                    Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteHard"),
                    Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteHard")
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