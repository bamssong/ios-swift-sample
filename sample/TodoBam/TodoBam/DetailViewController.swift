//
//  DetailViewController.swift
//  TodoBam
//
//  Created by dev.bamssong on 2015. 9. 14..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var type : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    override func viewWillDisappear(animated: Bool) {
        print("detail finish -> need to save.")
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
