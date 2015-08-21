//
//  ViewController.swift
//  UIDynamicsSample
//
//  Created by anseungjin on 2015. 8. 21..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var animator : UIDynamicAnimator!
    var boundCollision : UICollisionBehavior!
    var gravityBehavior : UIGravityBehavior!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        
        gravityBehavior = UIGravityBehavior()
        self.animator.addBehavior(gravityBehavior)
        
        boundCollision = UICollisionBehavior()
        boundCollision.setTranslatesReferenceBoundsIntoBoundaryWithInsets(UIEdgeInsetsZero)
        
        self.animator.addBehavior(boundCollision)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func tapGesture(sender: UITapGestureRecognizer) {
        let item = UIView(frame: CGRectMake(0,0, 100, 100))
        item.center = sender.locationInView(sender.view)
        
        let red = CGFloat( arc4random() % 255 ) / 255.0
        let green = CGFloat( arc4random() % 255 ) / 255.0
        let blue = CGFloat( arc4random() % 255 ) / 255.0
        
        let blockColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        item.backgroundColor = blockColor
        
        self.view.addSubview(item)
        
        gravityBehavior.addItem(item)
        boundCollision.addItem(item)
    }

}

