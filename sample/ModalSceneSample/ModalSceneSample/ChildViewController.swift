//
//  ChildViewController.swift
//  ModalSceneSample
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

protocol ModalActionDelegate : class {
    func completeWithModalAction(data : String!)
}

class ChildViewController: UIViewController {

    var delegate : ModalActionDelegate!
    var data : String = ""
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func back(sender: AnyObject) {
        let data = textField.text
        
        if delegate != nil {
            delegate.completeWithModalAction(data)
        }
        
        self.dismissViewControllerAnimated(true, completion : nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        textField.text = data
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
