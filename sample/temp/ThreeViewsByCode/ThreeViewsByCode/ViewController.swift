//
//  ViewController.swift
//  ThreeViewsByCode
//
//  Created by anseungjin on 2015. 8. 19..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create red color view
        let frame = CGRectMake(20, 40, 150, 150)
        let redView = UIView(frame: frame)
        redView.backgroundColor = UIColor.redColor()
        redView.alpha = 0.6
        
        //create blue color view
        let blueView = UIView(frame: CGRectMake(100, 100, 200, 150))
        blueView.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.7)
        
        //create green color view
        let greenView = UIView()
        greenView.frame = CGRectMake(40, 150, 150, 200)
        greenView.backgroundColor = UIColor.greenColor()
        greenView.alpha = 0.8
        
        self.view.addSubview(redView)
        self.view.addSubview(blueView)
        self.view.addSubview(greenView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

