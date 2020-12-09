//
//  ViewController.swift
//  AnimationProblem
//
//  Created by Paul Bryan on 11/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var containerWidth: NSLayoutConstraint!
    @IBOutlet weak var btnToggle: UIButton!
    
    var small: CGFloat = 50
    var large: CGFloat { view.bounds.width - 25 }
    var isSmall = false
    var angle = CGFloat.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set initial container size
        containerWidth.constant = large
        
        btnToggle.addTarget(self, action: #selector(toggle), for: .touchUpInside)
    }
    
    @objc func toggle(sender: UIButton) {
        self.view.layoutIfNeeded()
        
        isSmall.toggle()
        
        // update width and increment rotation angle
        containerWidth.constant = isSmall ? small : large
        angle += CGFloat.pi/4
        
        // keep it in the range 0..<twoPi
        angle = angle.truncatingRemainder(dividingBy: CGFloat.pi * 2)
        
        // animate layout changes
        UIView.animate(withDuration: 1, animations: {
            self.container.transform = CGAffineTransform(rotationAngle: self.angle)
            self.view.layoutIfNeeded()
        })
    }
}
