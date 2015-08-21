//
//  DrawingView.swift
//  DrawingViewSample
//
//  Created by anseungjin on 2015. 8. 21..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    var path = UIBezierPath()
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        self.backgroundColor = UIColor.whiteColor()

        path.stroke()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let point = touch.locationInView(self)
        
        path.moveToPoint(point)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch
        let point = touch.locationInView(self)
        
        path.addLineToPoint(point)
        self.setNeedsDisplay()
    }
    
  
}
