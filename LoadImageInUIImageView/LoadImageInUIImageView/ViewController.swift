//
//  ViewController.swift
//  LoadImageInUIImageView
//
//  Created by anseungjin on 2015. 8. 19..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    var imageView3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //파일 이름으로 이미지 생성.
        imageView1.image = UIImage(named: "bamssong.png")
        
        //파일 경로에서 이미지 생성. 
        //optional binding
        if let filePath = NSBundle.mainBundle().pathForResource("bamssong", ofType: "png") {
            if let image2 = UIImage(contentsOfFile:filePath) {
                imageView2.image = image2
            }
        }
        
        //인터넷 다운로드 & create view in code
        imageView3 = UIImageView(frame: CGRectMake(162, 209, 100, 100))
        imageView3.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(imageView3)
        
        if let imageUrl = NSURL(string: "http://cfile25.uf.tistory.com/image/2334C24F54697A5A242502") {
            if let imageData = NSData(contentsOfURL: imageUrl) {
                if let image3 = UIImage(data: imageData) {
                    imageView3.image = image3
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

