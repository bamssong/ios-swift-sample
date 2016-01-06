//
//  FullScreenViewController.swift
//  GoogleMap
//
//  Created by dev.bamssong on 2016. 1. 6..
//  Copyright © 2016년 bamssong. All rights reserved.
//

import UIKit
import GoogleMaps

class FullScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //https://developers.google.com/maps/documentation/ios-sdk/start?hl=ko
        let camera = GMSCameraPosition.cameraWithLatitude(37.522831,
            longitude: 127.027183, zoom: 14)
        let mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        mapView.myLocationEnabled = true
        self.view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(37.522831, 127.027183)
        marker.title = "nestberg"
        marker.snippet = "hello?!"
        marker.map = mapView
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
