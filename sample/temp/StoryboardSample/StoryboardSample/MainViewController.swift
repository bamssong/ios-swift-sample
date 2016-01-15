//
//  MainViewController.swift
//  StoryboardSample
//
//  Created by dev.bamssong on 2015. 8. 25..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func callStoryboard1(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Storyboard1", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("Storyboard1Root") as! UIViewController
        presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func callStoryboardContainerView(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "StoryboardContainerView", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("StoryboardContainerViewRoot") as! UIViewController
        presentViewController(vc, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
