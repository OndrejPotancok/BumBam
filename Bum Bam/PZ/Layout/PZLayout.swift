//
//  PZLayout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZLayout {
    
    
    var layout = Layout(
        subviews: [
            "background": Layout(),
            "game": Layout(
                subviews: [
                    "slider": MultiLayout(
                        count: 9,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIScrollView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.9, width: prntW, height: prntW*PZConfig.sliderSquareSizeCoeff))
                            view.contentSize = CGSize(width: prntW*PZConfig.sliderSquareSizeCoeff*9, height: view.bounds.height)
                            view.panGestureRecognizer.cancelsTouchesInView = false
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            var view = PZTileHelperView(frame: CGRect(
                                centerx: (id+0.5)*PZConfig.sliderSquareSizeCoeff*prntW,
                                centery: prntH*0.5,
                                width: PZConfig.tileSizeCoeff*prntW,
                                height: PZConfig.tileSizeCoeff*prntW)
                            )
                            view.image = UIImage(named: "puzzle1_\(id)")!.desaturate()
                            view.userInteractionEnabled = true
                            return view
                        }, subsubviews: [:]),
                    "tiles": MultiLayout(
                        count: 9,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = PZTilesView(frame: CGRectMake(0,0,prntW,prntH))
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            var view = PZTileView(frame: CGRect(centerx: 0, centery: 0, width: 0, height: 0))
                            view.image = UIImage(named: "puzzle1_\(id)")
                            //view.userInteractionEnabled = true
                            return view
                        },
                        subsubviews: [:]),
                    "board": MultiLayout(
                        count: 9,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIView(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.4, width: prntW*0.9, height: prntW*0.9))
                            view.userInteractionEnabled = true
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            let countInRow = Int(sqrt(Double(count)))
                            let row = floor(CGFloat(Int(id)/countInRow))
                            let column = CGFloat(Int(id)%countInRow)
                            var view = PZBoardTileView(frame: CGRect(centerx: (column+0.5)*(prntW/CGFloat(countInRow)), centery: (row+0.5)*(prntH/CGFloat(countInRow)), width: prntW/3, height: prntH/3))
                            if(Int(id)%2==0) {
                                view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
                            } else {
                                view.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                            }
                            return view
                        },
                        subsubviews: [:])
                ])
        ]
    )
    
}