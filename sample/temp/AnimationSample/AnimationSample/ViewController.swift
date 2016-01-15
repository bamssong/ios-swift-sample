//
//  ViewController.swift
//  AnimationSample
//
//  Created by dev.bamssong on 2015. 8. 21..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var block: UIView!
    
    var multiOn = false
    
    func move(view : UIView) -> Void {
        let width = self.view.frame.width - view.frame.width
        let height = self.view.frame.height - view.frame.height - 64
        
        var x = arc4random_uniform(UInt32(width))
        var y = arc4random_uniform(UInt32(height))
        
        println("width : \(width) ,height \(height)")
        println("x : \(x) ,y \(y)")
        view.center = CGPointMake(CGFloat(x), CGFloat(y))
    }
    
    func scale(view : UIView) -> Void {
        let length = arc4random_uniform(200) + 100
        println("length : \(length)")
        view.frame.size = CGSizeMake(CGFloat(length), CGFloat(length))
    }
    
    
    func moveAnim(view : UIView) -> Void {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
           self.move(view)
        }) { (Bool) -> Void in
            if self.multiOn {
                self.scaleAnim(view)
            }
        }
    }
    
    
    func scaleAnim(view : UIView) -> Void {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.scale(view)
        }) { (Bool) -> Void in
            if self.multiOn {
                self.moveAnim(view)
            }
        }
    }
    
    func startAnimate(targetView : UIView , start : (view : UIView) -> (), next : (view : UIView) -> ()) {
        
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            start(view: targetView)
        }) { (Bool) -> Void in
            if self.multiOn {
                self.startAnimate(targetView,start: next, next: start)
            }
        }
    }
       
    @IBAction func moveBlock(sender: UIBarButtonItem) {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.move(self.block)
        })
    }

    @IBAction func scaleBlock(sender: UIBarButtonItem) {
        UIView.animateWithDuration(1.0, animations: { () -> Void in
            self.scale(self.block)
        })
    }
  
    @IBAction func animateMulti(sender: UIBarButtonItem) {
        multiOn = true
        //moveAnim(block)
        
        startAnimate(block,start: scale, next: move)
    }
    
    @IBAction func stopAnimateMulti(sender: UIBarButtonItem) {
        multiOn = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

