//
//  MarkerHelper.swift
//  GoogleMap
//
//  Created by dev.bamssong on 2016. 1. 8..
//  Copyright © 2016년 bamssong. All rights reserved.
//
import UIKit
import GoogleMaps


class MarkerInfo {
    var latitude:CLLocationDegrees
    var longitude:CLLocationDegrees
    
    var name:String?
    var image:UIImage?
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        self.latitude = latitude
        self.longitude = longitude
    }
}

class MapInfo {
    var latitude:CLLocationDegrees
    var longitude:CLLocationDegrees
    var zoom:Float
    
    // MARK: - init
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, zoom: Float) {
        self.latitude = latitude
        self.longitude = longitude
        self.zoom = zoom
    }
    
    
 }

class GoogleMapHelper{
    static let sharedInstance = GoogleMapHelper()
    
    // MARK: - init
    init() {

    }
    
    // MARK: - marker
    func createMarker(markerInfo: MarkerInfo) -> GMSMarker{
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(
            markerInfo.latitude, markerInfo.longitude)

        marker.appearAnimation = kGMSMarkerAnimationPop
        //marker.icon = UIImage(named: "flag_icon")
        
        return marker
    }
}