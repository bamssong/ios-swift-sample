//
//  DetailViewController.swift
//  CartAndCatalog2
//
//  Created by dev.bamssong on 2015. 8. 24..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    var productName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        let data = "https://en.wikipedia.org/wiki/\(productName)"
        println(data)
        
        if let url = NSURL(string: data) {
            let request = NSURLRequest(URL: url)
            webview.loadRequest(request)
        }
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
