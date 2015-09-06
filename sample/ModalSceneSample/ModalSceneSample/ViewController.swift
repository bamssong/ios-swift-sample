//
//  ViewController.swift
//  ModalSceneSample
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalActionDelegate{

    @IBOutlet weak var textField: UITextField!
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("prepareForSegue!!")
        if segue.identifier == "MODAL_SEGUE" {
            let vc = segue.destinationViewController as! ChildViewController
            vc.delegate = self
            vc.data = textField.text
        }
    }
    
    @IBAction func modalCode1Type(sender: AnyObject) {
        self.performSegueWithIdentifier("MODAL_SEGUE", sender: sender)
    }
    
    @IBAction func modalCode2Type(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("CHILD_VC") as! ChildViewController
        vc.delegate = self
        vc.data = textField.text
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func completeWithModalAction(data : String!) {
        textField.text = data
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

