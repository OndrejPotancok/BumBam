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
            "background": Layout(createView: { (prntW, prntH) -> UIView in
                var view = UIImageView(frame: CGRectMake(0, 0, prntW, prntW*(16/9)))
                return view
            }),
            "game": Layout(
                subviews: [
                    "slider": MultiLayout(
                        count:4,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIScrollView(frame: getSliderFrame(prntH*0.9))
                            view.panGestureRecognizer.cancelsTouchesInView = false
                            view.autoresizingMask = UIViewAutoresizing.FlexibleWidth
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            var view = PZTileHelperView(frame: getSliderSubviewFrame(count, id: id))
                            view.layer.cornerRadius = sliderCornerRadius
                            view.userInteractionEnabled = true
                            view.alpha = 0.3
                            return view
                        }, subsubviews: [:]),
                    "tiles": MultiLayout(
                        count: 4,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = PZTilesView(frame: CGRectMake(0,0,prntW,prntH))
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            var view = PZTileView(frame: CGRect(centerx: 0, centery: 0, width: 1, height: 1))
                            view.layer.cornerRadius = sliderCornerRadius
                            view.layer.masksToBounds = true
                            view.layer.shadowColor = UIColor.blackColor().CGColor
                            view.layer.shadowOpacity = 0
                            view.layer.shadowOffset = CGSizeMake(0.0, 0.0)
                            view.layer.shadowRadius = 20.0
                            view.layer.borderColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1).CGColor
                            view.userInteractionEnabled = true
                            return view
                        },
                        subsubviews: [:]),
                    "board": MultiLayout(
                        count: 4,
                        defaultHidden: false,
                        createView: { (prntW, prntH) -> UIView in
                            var view = UIView(frame: CGRect(centerx: prntW*0.5, centery: prntW*(16/9)*(255+(1104/2))/2208, width: prntW*1104/1242, height: prntW*1104/1242))

                            view.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
                            
                            var borderLayer = CALayer()
                            borderLayer.frame = CGRectMake(-1, -1, view.frame.size.width+2, view.frame.size.height+2)
                            borderLayer.backgroundColor = UIColor.clearColor().CGColor
                            borderLayer.borderWidth = 1
                            borderLayer.borderColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1).CGColor
                            view.layer.addSublayer(borderLayer)
                            
                            view.userInteractionEnabled = true
                            return view
                        },
                        createSubview: { (id, count, prntW, prntH) -> UIView in
                            let countInRow = Int(sqrt(Double(count)))
                            let row = floor(CGFloat(Int(id)/countInRow))
                            let column = CGFloat(Int(id)%countInRow)
                            var view = PZBoardTileView(frame: CGRect(centerx: (column+0.5)*(prntW/CGFloat(countInRow)), centery: (row+0.5)*(prntH/CGFloat(countInRow)), width: prntW/CGFloat(countInRow), height: prntH/CGFloat(countInRow)))
                            /*if(Int(row)%2==0) == (Int(column)%2==0) {
                                view.backgroundColor = UIColor(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
                            } else {*/
                            view.backgroundColor = UIColor(red: 190/255, green: 190/255, blue: 190/255, alpha: 1)
                            //}
                            view.layer.borderColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1).CGColor
                            view.layer.borderWidth = 1
                            view.userInteractionEnabled = true
                            return view
                        },
                        subsubviews: [
                            "number": Layout(
                                defaultHidden: false,
                                createView: { (prntW, prntH) -> UIView in
                                    var label = UILabel(frame: CGRect(centerx: prntW*0.5, centery: prntH*0.5, width: prntW, height: prntH))
                                    label.font = buttonFont
                                    label.textAlignment = .Center
                                    label.textColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)
                                    return label
                            })
                        ])
                ])
        ]
    )
    
}




