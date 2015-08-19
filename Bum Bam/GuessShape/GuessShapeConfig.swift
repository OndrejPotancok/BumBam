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
    
    static var thumbReturningAnimationDuration: NSTimeInterval = 0.3
    static var thumbToSiluetteAnimationDuration: NSTimeInterval = 0.3
    static var delayAfterSuccess: Double = 1
    
    static var defaultSettingsBlocks: [GuessShapeHelper.SettingsBlock] = [
        GuessShapeHelper.SettingsBlock(name: "selectShapeSet", subviewsCount: GuessShapeConfig.shapeSets.count),
        GuessShapeHelper.SettingsBlock(name: "selectShapeSubSet", subviewsCount: 2),
        GuessShapeHelper.SettingsBlock(name: "selectDifficulty", subviewsCount: 3),
        GuessShapeHelper.SettingsBlock(name: "playButton", subviewsCount: 1)
    ]
    
    static var imageNamesPrefix = "GuessShape-"
    
    static var shapeSets: [GuessShapeHelper.ShapeSet] = [
        GuessShapeHelper.ShapeSet(
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
                    GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "dino", siluetteImageName: "dinoSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette")
                ],
                "medium": [
                    GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "dino", siluetteImageName: "dinoSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette")
                ],
                "hard": [
                    GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette")
                ]
            ]
        ),
        GuessShapeHelper.ShapeSet(
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
                    GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette")
                ],
                "medium": [
                    GuessShapeHelper.Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluette")
                ],
                "hard": [
                    GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "sheep", siluetteImageName: "sheepSiluette"),
                    GuessShapeHelper.Shape(thumbImageName: "monkey", siluetteImageName: "monkeySiluette")
                ]
            ]
        ),
        GuessShapeHelper.ShapeSet(
            settingsBackgroundImageName: "backgroundAnimals",
            settingsShapeSetImageName: "gameIconAnimals",
            color: UIColor(red: 66/255, green: 31/255, blue: 35/255, alpha: 1),
            shapeSubSets: [
                GuessShapeHelper.ShapeSubSet(
                    gameBackgroundImageName: "backgroundGame",
                    settingsBackgroundImageName: "backgroundAnimalsGround",
                    settingsShapeSubSetImageName: "gameIconAnimalsGround",
                    settingsDifficultyImageNames: [
                        "diffEasy",
                        "diffMedium",
                        "diffHard"
                    ],
                    color: UIColor(red: 64/255, green: 38/255, blue: 16/255, alpha: 1),
                    shapes: [
                        "easy": [
                            GuessShapeHelper.Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteEasy")
                        ],
                        "medium": [
                            GuessShapeHelper.Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteMedium")
                        ],
                        "hard": [
                            GuessShapeHelper.Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteHard")
                        ]
                        
                    ]
                ),
                GuessShapeHelper.ShapeSubSet(
                    gameBackgroundImageName: "backgroundGame",
                    settingsBackgroundImageName: "backgroundAnimalsWater",
                    settingsShapeSubSetImageName: "gameIconAnimalsWater",
                    settingsDifficultyImageNames: [
                        "diffEasy",
                        "diffMedium",
                        "diffHard"
                    ],
                    color: UIColor(red: 16/255, green: 56/255, blue: 64/255, alpha: 1),
                    shapes: [
                        "easy": [
                            GuessShapeHelper.Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteEasy"),
                        ],
                        "medium": [
                            GuessShapeHelper.Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteMedium"),
                        ],
                        "hard": [
                            GuessShapeHelper.Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteHard"),
                        ]
                    ]
                ),
            ]),
        GuessShapeHelper.ShapeSet(
            settingsBackgroundImageName: "backgroundAnimals",
            settingsShapeSetImageName: "gameIconAnimals",
            color: UIColor(red: 66/255, green: 31/255, blue: 35/255, alpha: 1),
            shapeSubSets: [
                GuessShapeHelper.ShapeSubSet(
                    gameBackgroundImageName: "backgroundGame",
                    settingsBackgroundImageName: "backgroundAnimalsGround",
                    settingsShapeSubSetImageName: "gameIconAnimalsGround",
                    settingsDifficultyImageNames: [
                        "diffEasy",
                        "diffMedium",
                        "diffHard"
                    ],
                    color: UIColor(red: 64/255, green: 38/255, blue: 16/255, alpha: 1),
                    shapes: [
                        "easy": [
                            GuessShapeHelper.Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteEasy")
                        ],
                        "medium": [
                            GuessShapeHelper.Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteMedium")
                        ],
                        "hard": [
                            GuessShapeHelper.Shape(thumbImageName: "bear", siluetteImageName: "bearSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "buffalo", siluetteImageName: "buffaloSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "camel", siluetteImageName: "camelSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "cat", siluetteImageName: "catSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "cow", siluetteImageName: "cowSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "crocodile", siluetteImageName: "crocodileSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "deer", siluetteImageName: "deerSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "dog", siluetteImageName: "dogSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "duck", siluetteImageName: "duckSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "elephant", siluetteImageName: "elephantSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "flamingo", siluetteImageName: "flamingoSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "fox", siluetteImageName: "foxSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "giraffe", siluetteImageName: "giraffeSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "goat", siluetteImageName: "goatSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "goose", siluetteImageName: "gooseSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "hedgehog", siluetteImageName: "hedgehogSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "hippo", siluetteImageName: "hippoSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "horse", siluetteImageName: "horseSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "kangaroo", siluetteImageName: "kangarooSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "lama", siluetteImageName: "lamaSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "lion", siluetteImageName: "lionSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "ostrich", siluetteImageName: "ostrichSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "owl", siluetteImageName: "owlSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "peacock", siluetteImageName: "peacockSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "pig", siluetteImageName: "pigSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "rhino", siluetteImageName: "rhinoSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "snake", siluetteImageName: "snakeSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "stork", siluetteImageName: "storkSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "tiger", siluetteImageName: "tigerSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "toucan", siluetteImageName: "toucanSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "turkey", siluetteImageName: "turkeySiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "wolf", siluetteImageName: "wolfSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "zebra", siluetteImageName: "zebraSiluetteHard")
                        ]
                        
                    ]
                ),
                GuessShapeHelper.ShapeSubSet(
                    gameBackgroundImageName: "backgroundGame",
                    settingsBackgroundImageName: "backgroundAnimalsWater",
                    settingsShapeSubSetImageName: "gameIconAnimalsWater",
                    settingsDifficultyImageNames: [
                        "diffEasy",
                        "diffMedium",
                        "diffHard"
                    ],
                    color: UIColor(red: 16/255, green: 56/255, blue: 64/255, alpha: 1),
                    shapes: [
                        "easy": [
                            GuessShapeHelper.Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteEasy"),
                            GuessShapeHelper.Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteEasy"),
                        ],
                        "medium": [
                            GuessShapeHelper.Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteMedium"),
                            GuessShapeHelper.Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteMedium"),
                        ],
                        "hard": [
                            GuessShapeHelper.Shape(thumbImageName: "blueFish", siluetteImageName: "blueFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "crab", siluetteImageName: "crabSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "diodon", siluetteImageName: "diodonSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "dolphin", siluetteImageName: "dolphinSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "goldenFish", siluetteImageName: "goldenFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "jib", siluetteImageName: "jibSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus", siluetteImageName: "octopusSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "octopus2", siluetteImageName: "octopus2SiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "pinkFish", siluetteImageName: "pinkFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "purpleFish", siluetteImageName: "purpleFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "redFish", siluetteImageName: "redFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "seahorse", siluetteImageName: "seahorseSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "shark", siluetteImageName: "sharkSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "shrimp", siluetteImageName: "shrimpSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "starFish", siluetteImageName: "starFishSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "turtle", siluetteImageName: "turtleSiluetteHard"),
                            GuessShapeHelper.Shape(thumbImageName: "yelloeFish", siluetteImageName: "yelloeFishSiluetteHard"),
                        ]
                    ]
                ),
            ])
        
    ]
}





