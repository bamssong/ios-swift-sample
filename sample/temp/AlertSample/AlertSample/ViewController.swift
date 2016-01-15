//
//  ViewController.swift
//  AlertSample
//
//  Created by anseungjin on 2015. 8. 19..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBAction func clinckBasicAlertViewStyle(sender: AnyObject) {
        let dialog = UIAlertController(title: "title", message: "Basic AlertView Style", preferredStyle: UIAlertControllerStyle.Alert)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: {(action) -> Void in print("cancel")})
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: {(action) -> Void in print("ok")})

        dialog.addAction(okAction)
        dialog.addAction(cancelAction)

        
        self.presentViewController(dialog, animated: true, completion: nil)
    }
    
    
    @IBAction func clickAlertStyleWithTextField(sender: AnyObject) {
        let dialog = UIAlertController(title: "title", message: "AlertSytle with TextField", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: {(action) -> Void in print("cancel")})
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: {(action) -> Void in
            let userInput = dialog.textFields![0] 
            self.label.text = userInput.text
            print("ok")})
        
        
        func addTextField(textField: UITextField!){
            textField.keyboardType = UIKeyboardType.NumberPad
        }
        
        dialog.addAction(okAction)
        dialog.addAction(cancelAction)
        dialog.addTextFieldWithConfigurationHandler(addTextField)
    
        self.presentViewController(dialog, animated: true, completion: nil)
        
    }
    
    @IBAction func clickBasicActionsheetStyle(sender: AnyObject) {
        let dialog = UIAlertController(title: "title", message: "Basic AlertView Style", preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel, handler: {(action) -> Void in print("cancel")})
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: {(action) -> Void in print("ok")})

        let otherAction = UIAlertAction(title: "otherAction", style: UIAlertActionStyle.Destructive, handler: {(action) -> Void in print("ok")})

        dialog.addAction(okAction)
        dialog.addAction(cancelAction)
        dialog.addAction(otherAction)
        
        self.presentViewController(dialog, animated: true, completion: nil)
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

