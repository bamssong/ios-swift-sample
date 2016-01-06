//
//  MapViewController.swift
//  GoogleMap
//
//  Created by dev.bamssong on 2016. 1. 6..
//  Copyright © 2016년 bamssong. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //https://developers.google.com/maps/documentation/ios-sdk/start?hl=ko
        let camera = GMSCameraPosition.cameraWithLatitude(37.522831,longitude: 127.027183, zoom: 14)
        
        mapView.camera = camera
        mapView.myLocationEnabled = true
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
