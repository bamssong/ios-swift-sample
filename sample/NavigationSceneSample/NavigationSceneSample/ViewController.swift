//
//  ViewController.swift
//  NavigationSceneSample
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBAction func showSecond1(sender: AnyObject) {
        self.performSegueWithIdentifier("PUSH_SEUGE", sender: sender)
    }

    @IBAction func showSecond2(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SECOND_VC") as! SecondViewController
        vc.data = textField.text
        
        self.showViewController(vc, sender: sender)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PUSH_SEUGE" {
            let second = segue.destinationViewController as! SecondViewController
            second.data = textField.text
        }
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

