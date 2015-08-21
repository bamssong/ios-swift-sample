//
//  ViewController.swift
//  DrawingViewSample
//
//  Created by anseungjin on 2015. 8. 21..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var drawingView = DrawingView()
        drawingView.frame = self.view.frame
        drawingView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(drawingView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

