//
//  ViewController.swift
//  PagingPhotoScrollView
//
//  Created by anseungjin on 2015. 8. 20..
//  Copyright (c) 2015년 bamssong. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UIScrollViewDelegate{
    let imageList = ["1","2","3","4","5","6"]
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!

    @IBAction func handlePageControlValueChanged(sender: UIPageControl) {
        let pageSize = scrollView.frame.size
        let x = pageSize.width * CGFloat(sender.currentPage)
        
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var page = pageControl.currentPage
        
        var x = scrollView.contentOffset.x/scrollView.frame.size.width
        if(page < Int(x)){
            pageControl.currentPage = page + 1
        } else {
            pageControl.currentPage = page - 1
        }
 
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.pagingEnabled = true
        pageControl.numberOfPages = imageList.count
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidLayoutSubviews() {
        let pageSize = scrollView.frame.size
        let photoCount = imageList.count
        
        var count = 0
        for imageName in imageList {
            if let image = UIImage(named: imageName) {
                let imageView = UIImageView(image: image)

                imageView.frame = CGRectMake(pageSize.width * CGFloat(count), 0, pageSize.width, pageSize.height)
                
                count++
                scrollView.addSubview(imageView)
            }
        }
        scrollView.contentSize = CGSizeMake( pageSize.width * CGFloat(count) , pageSize.height)

    }
    
    
}

