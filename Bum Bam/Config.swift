//
//  Config.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 06/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

let ScrnW = UIScreen.mainScreen().bounds.size.width
let ScrnH = UIScreen.mainScreen().bounds.size.height
let fullscreen = CGRectMake(0, 0, ScrnW, ScrnH)
let labelFont = UIFont(name: "schoolbell", size: 20)
let buttonFont = UIFont(name: "schoolbell", size: 45)

let settingsSquareSizeCoeff: CGFloat = 912/3240
let settingsImageSizeCoeff: CGFloat = 874/4575
let settingsMarginCoeff: CGFloat = (1-settingsSquareSizeCoeff*3)/2