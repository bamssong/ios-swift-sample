//
//  ViewController.swift
//  SCLAlertViewSample
//
//  Created by dev.bamssong on 2015. 11. 1..
//  Copyright © 2015년 bamssong. All rights reserved.
//

import UIKit
import SCLAlertView

class ViewController: UIViewController {

    @IBAction func onClick(sender: UIButton) {
        SCLAlertView().showInfo("Important info", subTitle: "You are great")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

