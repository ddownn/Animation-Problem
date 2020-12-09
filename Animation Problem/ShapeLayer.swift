//
//  ShapeLayer.swift
//  AnimationProblem
//
//  Created by Paul Bryan on 11/18/20.
//

import UIKit

class ShapeLayer: CAShapeLayer {

    private var lineW: CGFloat { return max(bounds.width/33.0, 1) }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        path = UIBezierPath(ovalIn: bounds.insetBy(dx: lineW/2, dy: lineW/2)).cgPath
    }
    
    private func commonInit() {
        lineWidth = lineW
        strokeColor = UIColor.black.cgColor
    }
    
    override init(layer: Any) {
        // https://developer.apple.com/documentation/quartzcore/calayer/1410842-init
        // https://stackoverflow.com/a/36017699/10811427
        // https://stackoverflow.com/a/38468678/10811427
        super.init(layer: layer)
        commonInit()
    }
    
    override init() {
        super.init()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
}
