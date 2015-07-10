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
            /*"settings": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.backgroundColor = UIColor.redColor()
                    return view
                },
                subviews: [
                    "selectShapeLabel": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UILabel(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.2, width: 200, height: 50))
                            view.text = "shape to guess"
                            view.textAlignment = NSTextAlignment.Center
                            view.textColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1.0)
                            return view
                    }),
                    "selectShape": Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = AKPickerView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.3, width: prntW*0.9, height: 60))
                            view.dataSource = GuessShapeSelectShapeDataSourceInstance
                            return view
                    }),
                    "selectDifficultyLabel": Layout(
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UILabel(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.5, width: 200, height: 50))
                            view.text = "select difficulty"
                            view.textAlignment = NSTextAlignment.Center
                            view.textColor = UIColor(red: 245, green: 245, blue: 245, alpha: 1.0)
                            return view
                    }),
                    "startGameButton": Layout(
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIButton(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.8, width: 200, height: 50))
                            view.setTitle("START GAME", forState: .Normal)
                            view.setTitleColor(UIColor(red: 245, green: 245, blue: 245, alpha: 1.0), forState: .Normal)
                            return view
                    })
                    
                ]),*/
            
            "background": Layout(
                createView: { (prntW, prntH) -> UIView in
                    var view = UIView(frame: CGRectMake(0, 0, prntW, prntH))
                    view.backgroundColor = UIColor.greenColor()
                    return view
            }),
            "game": Layout(
                subviews: [
                    "siluette" : Layout(
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIImageView(frame: CGRect(centerx: prntW/2, centery: prntH/3, width: min(prntW, prntH)*0.6, height: min(prntW, prntH)*0.6))
                            view.image = UIImage(named: "GuessShape-goatSiluette")
                            return view
                    }),
                    "thumbCenter": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.5, centery: prntH-70, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-goat")
                            return view
                    }),
                    "thumbLeft": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.2, centery: prntH-70, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-dino")
                            return view
                    }),
                    "thumbRight": Layout(
                        createView: {(prntW, prntH) -> UIView in
                            var view = GuessShapeThumbView(frame: CGRect(centerx: prntW*0.8, centery: prntH-70, width: 100, height: 100))
                            view.image = UIImage(named: "GuessShape-giraffe")
                            return view
                    }),
                ])
        ]
    )
    
}







