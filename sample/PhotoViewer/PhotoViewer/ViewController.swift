//
//  ViewController.swift
//  PhotoViewer
//
//  Created by anseungjin on 2015. 8. 18..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let PREVIOUS_TAG = 1,NEXT_TAG = 2
    let START_INDEX = 0, END_INDEX = 4
    
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    let imageList = ["TestImage","TestImage1","TestImage2","TestImage3","TestImage4"]
    //let imageList = ["TestImage","23","TestImage2","TestImage3","TestImage4"]//fail test list.
    let defaultImage = "DefaultImage"
    var imageIndex = 0
    
    @IBOutlet weak var imageViewerView: UIImageView!
    
    @IBAction func chnagePhoto(sender: UIButton) {
        //let image = getUIImage(index:1)

        if (sender.tag == PREVIOUS_TAG) {
            imageIndex -= 1
        } else if (sender.tag == NEXT_TAG) {
            imageIndex += 1
        }
        
        updateUIButton(index:imageIndex)
        updateUIImage(index:imageIndex)
    }
    
    func updateUIButton(index i:Int){
        if(i == START_INDEX) {
            previousButton.hidden = true
        } else if(i == END_INDEX){
            nextButton.hidden = true
        } else {
            previousButton.hidden = false
            nextButton.hidden = false
        }
    }
    
    func updateUIImage(index i:Int) {
        if let image = UIImage(named: imageList[i]) {
            imageViewerView.image = image
        } else {
            println("find not image...")
            imageViewerView.image = UIImage(named: defaultImage)
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUIButton(index: imageIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

