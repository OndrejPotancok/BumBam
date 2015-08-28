//
//  PZGameController.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class PZGameController: MainGameController, UIScrollViewDelegate, PPZTileViewDelegate {
    
    var gameModel: PZGameModel!
    var layoutAction: PZLayoutAction!
    
    var gameLayout: Layout!
    var tileViews: [PZTileView]!
    var tileHelperViews: [PZTileHelperView]!
    var boardTileViews: [PZBoardTileView]!
    
    override init(gameModel: MainGameModel, layoutAction: MainLayoutAction, layout: Layout) {
        super.init(gameModel: gameModel, layoutAction: layoutAction, layout: layout)
        self.gameModel = self.mainGameModel as! PZGameModel
        self.layoutAction = self.mainLayoutAction as! PZLayoutAction
        
    }
    override func gameWillStart() {
        self.gameModel.puzzleImageID = 0
        self.gameModel.count = 16
        self.gameModel.difficulty = 1
        
        self.gameLayout = self.layout["game"]
        
        (self.gameLayout["slider"] as! MultiLayout).count = self.gameModel.count
        (self.gameLayout["tiles"] as! MultiLayout).count = self.gameModel.count
        (self.gameLayout["board"] as! MultiLayout).count = self.gameModel.count
        
    }
    override func gameDidStart() {
        let sliderView = self.gameLayout["slider"]!.view as! UIScrollView
        sliderView.contentSize = getSliderContentSize(self.gameModel.count)
        sliderView.delegate = self
        self.gameLayout.view.sendSubviewToBack(self.gameLayout["slider"]!.view)
        self.gameLayout.view.sendSubviewToBack(self.gameLayout["board"]!.view)
        
        self.tileViews = []
        self.tileHelperViews = []
        self.boardTileViews = []
        for index in 0..<self.gameModel.count {
            self.tileViews.append(self.gameLayout["tiles"]!["\(index)"]!.view as! PZTileView)
            self.tileHelperViews.append(self.gameLayout["slider"]!["\(index)"]!.view as! PZTileHelperView)
            self.boardTileViews.append(self.gameLayout["board"]!["\(index)"]!.view as! PZBoardTileView)
            self.tileViews.last!.tileHelperToWatch = self.tileHelperViews.last!
            self.tileHelperViews.last!.tile = self.tileViews.last!
            self.tileViews.last!.delegate = self
            self.tileViews.last!.image = self.gameModel.getImage(index)
            self.tileHelperViews.last!.image = self.gameModel.getGrayImage(self.gameModel.orderInSlider[index])
            if self.gameModel.visibleTiles.contains(index) {
                self.boardTileViews.last!.image = self.gameModel.getGrayImage(index)
            }
        }
        for index in 0..<self.gameModel.count {
            self.tileViews[self.gameModel.orderInSlider[index]].tileHelperToWatch = self.tileHelperViews[index]
            self.tileHelperViews[index].tile = self.tileViews[self.gameModel.orderInSlider[index]]
        }
        (self.layout["background"]!.view as! UIImageView).image = UIImage(named: PZConfig.puzzleImages[self.gameModel.puzzleImageID].backgroundImageName)
        self.updateSlider()
    }
    
    func getBoardTileView(point: CGPoint) -> PZBoardTileView? {
        if let view = self.gameLayout["board"]!.view.hitTest(self.gameLayout["tiles"]!.view.convertPoint(point, toView: self.gameLayout["board"]!.view), withEvent: nil) as? PZBoardTileView {
            return view
        }
        return nil
    }
    
    func checkForSuccess() -> Bool {
        for index in 0..<self.gameModel.count {
            if index != self.boardTileViews[index].tileView?.index {
               return false
            }
        }
        print("success")
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            for boardTileView in self.boardTileViews {
                boardTileView.alpha = 0
            }
            for tileView in self.tileViews {
                tileView.alpha = 0
            }
            self.gameLayout["board"]!.view.alpha = 0
            }, completion: nil)
        delay(1) {
            self.restartGame()
        }
        return true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.updateSlider()
    }
    
    func updateSlider() {
        for tileView in self.tileViews {
            tileView.updateInSlider()
        }
    }
}