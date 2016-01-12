//
//  MapViewController.swift
//  GoogleMap
//
//  Created by dev.bamssong on 2016. 1. 6..
//  Copyright © 2016년 bamssong. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //https://developers.google.com/maps/documentation/ios-sdk/start?hl=ko
        let camera = GMSCameraPosition.cameraWithLatitude(37.522831,longitude: 127.027183, zoom: 14)
        mapView.delegate = self
        mapView.camera = camera
        mapView.myLocationEnabled = true
        
        //create marker
        let marker = GoogleMapHelper.sharedInstance.createMarker(MarkerInfo(latitude: 37.523831,longitude: 127.023183))
        marker.map = mapView;
        
        //create markers
        let markerList = [
            MarkerInfo(latitude: 37.522831,longitude: 127.023183),
            MarkerInfo(latitude: 37.522831,longitude: 127.024183),
            MarkerInfo(latitude: 37.522831,longitude: 127.025183),
            MarkerInfo(latitude: 37.522831,longitude: 127.026283),
            MarkerInfo(latitude: 37.522831,longitude: 127.027383),
            MarkerInfo(latitude: 37.522831,longitude: 127.028483)
        ]
        
        let markers = GoogleMapHelper.sharedInstance.createMarkers(markerList)
        
        for marker in markers {
            marker.map = mapView
        }
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
    
    // MARK: - GMSMapViewDelegate
    func mapView(mapView: GMSMapView!, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D) {
        let markerInfo = MarkerInfo(latitude: coordinate.latitude,longitude: coordinate.longitude)
        
        //add marker.
        let marker = GoogleMapHelper.sharedInstance.createMarker(markerInfo)
        marker.map = mapView;
        
        //show view - info
        markerInfo.name = "테스트1"
    }

}
