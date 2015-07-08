//
//  Layout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

class Layout {
    
    var _view: UIView!
    var view: UIView {
        /*if self._view == nil {
            self.create()
        }*/
        return self._view
    }
    var createView: () -> UIView
    var subviews: [String : Layout]
    var defaultHidden: Bool
    
    init(defaultHidden: Bool, createView: () -> UIView, subviews: [String : Layout]) {
        
        self.createView = createView
        self.defaultHidden = defaultHidden
        self.subviews = subviews
    }
    convenience init(defaultHidden: Bool, subviews: [String : Layout]) {
        self.init(defaultHidden: defaultHidden, createView: {
            return UIView(frame: fullscreen)
            }, subviews: subviews)
    }
    convenience init(subviews: [String: Layout]) {
        self.init(defaultHidden: false, subviews: subviews)
    }
    convenience init() {
        self.init(subviews: [:])
    }
    convenience init(defaultHidden: Bool, createView: () -> UIView) {
        self.init(defaultHidden: defaultHidden, createView: createView, subviews: [:])
    }
    convenience init(createView: () -> UIView) {
        self.init(defaultHidden: false, createView: createView)
    }
    convenience init(createView: () -> UIView, subviews: [String : Layout]) {
        self.init(defaultHidden: false, createView: createView, subviews: subviews)
    }
    
    func create() {
        self._view = self.createView()
        for (name, subviewLayout) in self.subviews {
            subviewLayout.create()
            if(subviewLayout.defaultHidden == false) {
                self._view.addSubview(subviewLayout.view)
            }
        }
    }
    
    func createOnlySubview(subviewName: String) {
        if self._view == nil { self._view = self.createView() }
        for (name, subviewLayout) in self.subviews {
            if (name == subviewName) {
                subviewLayout.create()
                if subviewLayout.defaultHidden == false {
                    self._view.addSubview(subviewLayout.view)
                }
            }
        }
    }
    
    func delete() {
        self.view.removeFromSuperview()
        self._view = nil
        for (name, subviewLayout) in self.subviews {
            subviewLayout.delete()
        }
    }
    
    func showSubview(name: String) {
        if let subview = self.subviews[name]?.view {
            self.view.addSubview(subview)
        }
    }
    
    func hideSubview(name: String) {
        if let subview = self.subviews[name]?.view {
            subview.removeFromSuperview()
        }
    }
    
    subscript(subviewName:String) -> Layout? {
        return self.subviews[subviewName]
    }
    
}



class MultiLayout: Layout {
    
    var count: Int
    var subsubviews: [String : Layout]
    var createSubview: (id: CGFloat, count: CGFloat, parentWidth: CGFloat, parentHeight: CGFloat) -> UIView
    
    init(count: Int, defaultHidden: Bool, createView: () -> UIView, createSubview: (id: CGFloat, count: CGFloat, parentWidth: CGFloat, parentHeight: CGFloat) -> UIView, subsubviews: [String: Layout]) {
        self.count = count
        self.subsubviews = subsubviews
        self.createSubview = createSubview
        super.init(defaultHidden: defaultHidden, createView: createView, subviews: [:])
    }
    
    override func create() {
        self._view = self.createView()
        for id in 0..<self.count {
            var subview = Layout(createView: {return self.createSubview(id: CGFloat(id), count: CGFloat(self.count), parentWidth: self._view.bounds.width, parentHeight: self._view.bounds.height)}, subviews: self.subsubviews)
            self.subviews["\(id)"] = subview
            subview.create()
            self._view.addSubview(subview.view)
        }
    }
    
    override func createOnlySubview(subviewName: String) {
        fatalError("you cant use 'createOnlySubview' with MultiLayout")
    }
    
    override func delete() {
        super.delete()
        self.subviews = [:]
    }
    
}

















