//
//  UICutomView.swift
//  CustomViewSample
//
//  Created by anseungjin on 2015. 8. 21..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class UICutomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //code..
    }
    
    convenience init() {
        self.init(frame:CGRectZero)
    }

    //
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let str : NSString = "글자그리기"
        let attr = [NSForegroundColorAttributeName:UIColor.redColor(),NSFontAttributeName:UIFont.systemFontOfSize(30)]
        
        str.drawAtPoint(CGPointMake(10,10), withAttributes: attr)
    }

}
