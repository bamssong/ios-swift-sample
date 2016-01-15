//
//  ViewController.swift
//  TextField
//
//  Created by anseungjin on 2015. 8. 19..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var inputTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //show keyboard
        inputTextField.becomeFirstResponder()
        
        //
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //keyboard show & hide 감시
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(animated: Bool) {
        //remove notification observer.
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //
    func handleTap(gesture : UITapGestureRecognizer) {
        if let firstRespond = self.findFirstResponder(self.view) {
            firstRespond.resignFirstResponder()
        }
    }

    //
    func keyboardWillShow(noti : NSNotification) {
        //VIEW RESIZE?
    }
    
    func keyboardWillHide(noti : NSNotification) {
        //VIEW RESIZE?
    }
    
    
    
    //TextField
    @IBAction func textFieldDidEndExit(sender: UITextField) {
        
    }
    
    @IBAction func textFieldEditingChanged(sender: UITextField) {
        self.label.text = sender.text
    }
    
    @IBAction func textFieldEditingDidBegin(sender: UITextField) {
        self.label.textColor = UIColor.redColor()
    }
    
    @IBAction func textFieldEditingDidEnd(sender: UITextField) {
        self.label.textColor = UIColor.blackColor()
    }
    
    
    //Button
    @IBAction func hideKeyboard(sender: UIButton) {
        if let responder = findFirstResponder(self.view) {
            responder.resignFirstResponder()
        }
    }
    
    
    func findFirstResponder(view :UIView) -> UIResponder? {
        for v in view.subviews {
            if (v is UIControl) {
                if v.isFirstResponder() {
                    return (v as UIResponder)
                }
            } else {
                if v.subviews.count > 0 {
                    return findFirstResponder(v )
                }
            }
        }
        return nil
    }

}

