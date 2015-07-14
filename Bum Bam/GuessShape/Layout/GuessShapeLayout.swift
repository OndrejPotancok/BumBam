//
//  GuessShapeLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class GuessShapeLayout {
    
    
    var layout = Layout(
        subviews: [
            "settings": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.image = UIImage(named: "GuessShape-background_settings")
                    view.userInteractionEnabled = true
                    return view
                },
                subviews: [
                    "howToPlayImage": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.61, width: prntW*0.9, height: (prntW*0.9)*(560/1000)))
                            view.image = UIImage(named: "GuessShape-howToPlay")
                            return view
                    }),
                    "selectShapeLabel": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UILabel(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.23, width: prntW, height: 50))
                            view.text = "select shapes to play with"
                            view.textAlignment = NSTextAlignment.Center
                            view.textColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1.0)
                            view.font = labelFont
                            return view
                    }),
                    "selectShape": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = AKPickerView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.12, width: prntW, height: 60))
                            view.dataSource = GuessShapeSelectShapeDataSourceInstance
                            view.interitemSpacing = prntW*0.1
                            return view
                    }),
                    "selectDifficultyLabel": Layout(
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UILabel(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.39, width: 200, height: 50))
                            view.text = "select difficulty"
                            view.textAlignment = NSTextAlignment.Center
                            view.textColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1.0)
                            view.font = labelFont
                            return view
                    }),
                    "selectDifficultyEasy": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.25, centery: prntH*0.31, width: 50, height: 50))
                            view.image = UIImage(named: "GuessShape-DifficultyEasy")
                            return view
                    }),
                    "selectDifficultyMedium": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.31, width: 40, height: 40))
                            view.image = UIImage(named: "GuessShape-DifficultyMedium")
                            return view
                    }),
                    "selectDifficulty": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW*0.75, centery: prntH*0.31, width: 40, height: 40))
                            view.image = UIImage(named: "GuessShape-DifficultyHard")
                            return view
                    }),
                    "startGameButton": Layout(
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIButton.buttonWithType(UIButtonType.System) as! UIButton
                            view.frame = CGRect(centerx: prntW*0.5, centery: prntH*0.86, width: prntW, height: 50)
                            view.setTitle("START GAME", forState: .Normal)
                            view.setTitleColor(UIColor(red: 245, green: 245, blue: 245, alpha: 1.0), forState: .Normal)
                            view.titleLabel!.font = buttonFont
                            return view
                    }),
                    
                ]),
            
            "background": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.image = UIImage(named: "GuessShape-backgroundSettings")
                    return view
            }),
                
            "game": Layout(
                subviews: [
                    "siluette" : Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH*0.3, width: min(prntW, prntH)*0.6, height: min(prntW, prntH)*0.6))
                            view.image = UIImage(named: "GuessShape-goatSiluette")
                            return view
                    }),
                    "thumbCenter": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.5, centery: prntH-52, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-goat")
                            return view
                    }),
                    "thumbLeft": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.2, centery: prntH-52, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-dino")
                            return view
                    }),
                    "thumbRight": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.8, centery: prntH-52, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-giraffe")
                            return view
                    }),
                ])
        ]
    )
    







}