//
//  Layout.swift
//  Bum Bam
//
//  Created by Lukáš Baláž on 08/07/15.
//  Copyright (c) 2015 TuppleApps. All rights reserved.
//

import Foundation
import UIKit

typealias CreateView = (prntW: CGFloat, prntH: CGFloat) -> UIView

class Layout {
    
    var _view: UIView!
    var view: UIView {
        return self._view
    }
    var createView: CreateView
    var subviews: [String : Layout]
    var defaultHidden: Bool
    
    init(defaultHidden: Bool, createView: CreateView, subviews: [String : Layout]) {
        
        self.createView = createView
        self.defaultHidden = defaultHidden
        self.subviews = subviews
    }
    convenience init(defaultHidden: Bool, subviews: [String : Layout]) {
        self.init(defaultHidden: defaultHidden, createView: {(prntW, prntH) in
            return UIView(frame: CGRectMake(0, 0, prntW, prntH))
            }, subviews: subviews)
    }
    convenience init(subviews: [String: Layout]) {
        self.init(defaultHidden: false, subviews: subviews)
    }
    convenience init() {
        self.init(subviews: [:])
    }
    convenience init(defaultHidden: Bool, createView: CreateView) {
        self.init(defaultHidden: defaultHidden, createView: createView, subviews: [:])
    }
    convenience init(createView: CreateView) {
        self.init(defaultHidden: false, createView: createView)
    }
    convenience init(createView: CreateView, subviews: [String : Layout]) {
        self.init(defaultHidden: false, createView: createView, subviews: subviews)
    }
    
    func copy() -> Layout {
        var new = Layout(defaultHidden: self.defaultHidden, createView: self.createView, subviews: self.subviews)
        return new
    }
    
    func create(#prntW: CGFloat, prntH: CGFloat) {
        self._view = self.createView(prntW: prntW, prntH: prntH)
        for (name, subviewLayout) in self.subviews {
            subviewLayout.create(prntW: self._view.bounds.width, prntH: self._view.bounds.height)
            if name == "label" {println(unsafeAddressOf(subviewLayout))}
            if(subviewLayout.defaultHidden == false) {
                self._view.addSubview(subviewLayout.view)
            }
        }
    }
    
    func createOnlySubview(subviewName: String) {
        if self._view == nil { self._view = self.createView(prntW: ScrnW, prntH: ScrnH) }
        for (name, subviewLayout) in self.subviews {
            if (name == subviewName) {
                subviewLayout.create(prntW: self._view.bounds.width, prntH: self._view.bounds.height)
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
            if subview.superview == nil { self.view.addSubview(subview) }
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

protocol subviewOfMultiLayout : class {
    
    var index: Int! {get set}
    
}

class MultiLayout: Layout {
    
    var count: Int
    var subsubviews: [String : Layout]
    var createSubview: (id: CGFloat, count: CGFloat, prntW: CGFloat, prntH: CGFloat) -> UIView
    
    var prntW: CGFloat!
    var prntH: CGFloat!
    
    init(count: Int, defaultHidden: Bool, createView: CreateView, createSubview: (id: CGFloat, count: CGFloat, prntW: CGFloat, prntH: CGFloat) -> UIView, subsubviews: [String: Layout]) {
        self.count = count
        self.subsubviews = subsubviews
        self.createSubview = createSubview
        super.init(defaultHidden: defaultHidden, createView: createView, subviews: [:])
    }
    
    func recreateSubviews(count: Int) {
        self.deleteSubviews()
        self.count = count
        self.createSubviews()
    }
    
    override func create(#prntW: CGFloat, prntH: CGFloat) {
        self.prntW = prntW
        self.prntH = prntH
        self._view = self.createView(prntW: prntW, prntH: prntH)
        self.createSubviews()
    }
    
    private func createSubviews() {
        for id in 0..<self.count {
            var subsubviews_copy = [String: Layout]()
            for (subsubviewName, subsubviewLayout) in self.subsubviews {
                subsubviews_copy[subsubviewName] = subsubviewLayout.copy()
            }
            var subview = Layout(createView: {(prntW, prntH) in return self.createSubview(id: CGFloat(id), count: CGFloat(self.count), prntW: prntW, prntH: prntH)}, subviews: subsubviews_copy)
            self.subviews["\(id)"] = subview
            subview.create(prntW: self._view.bounds.width, prntH: self._view.bounds.height)
            if let view = subview.view as? subviewOfMultiLayout {
                view.index = id
            }
            self._view.addSubview(subview.view)
        }
    }
    
    private func deleteSubviews() {
        for id in 0..<self.count {
            self.subviews["\(id)"]!.delete()
        }
        self.subviews.removeAll(keepCapacity: false)
    }
    
    override func createOnlySubview(subviewName: String) {
        fatalError("you cant use 'createOnlySubview' with MultiLayout")
    }
    
    override func delete() {
        super.delete()
        self.subviews = [:]
    }
    
    override func copy() -> Layout {
        var layout = MultiLayout(count: self.count, defaultHidden: self.defaultHidden, createView: self.createView, createSubview: self.createSubview, subsubviews: self.subsubviews)
        return layout
    }
    
}





























