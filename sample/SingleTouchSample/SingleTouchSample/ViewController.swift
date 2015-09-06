//
//  ViewController.swift
//  SingleTouchSample
//
//  Created by anseungjin on 2015. 8. 21..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var holdingImage = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        println("touch began")
        let touch = touches.first as! UITouch
        let point = touch.locationInView(touch.view)
        
        if CGRectContainsPoint(imageView.frame, point) {
            holdingImage = true
        } else {
            holdingImage = false
        }
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        if holdingImage {
            let touch = touches.first as! UITouch
            let point = touch.locationInView(touch.view)
            
            imageView.center = point
        }
    }

    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
}

