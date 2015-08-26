//
//  DetailViewController.swift
//  ShoppingViewerFor11st
//
//  Created by dev.bamssong on 2015. 8. 26..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var detailUrl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(animated: Bool) {
        println(detailUrl)
        
        if let url = NSURL(string: detailUrl) {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }
    
    
}
