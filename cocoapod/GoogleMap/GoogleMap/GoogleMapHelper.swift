//
//  MarkerHelper.swift
//  GoogleMap
//
//  Created by dev.bamssong on 2016. 1. 8..
//  Copyright © 2016년 bamssong. All rights reserved.
//
import UIKit
import GoogleMaps


class MarkerInfoBuilder {
    var name:String?
    var icon:UIImage?
    var address:String?
    
    typealias BuilderClosure = (MarkerInfoBuilder) -> ()
    
    init(builderClosuer:BuilderClosure) {
        builderClosuer(self)
    }
}


class MarkerInfo : CustomStringConvertible{
    var marker:GMSMarker

    var name:String?
    var icon:UIImage?
    var address:String?
    
    init(latitude: CLLocationDegrees, longitude: CLLocationDegrees, builder: MarkerInfoBuilder){
       
        marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.appearAnimation = kGMSMarkerAnimationPop
        //marker.icon = UIImage(named: "flag_icon")
        
        //option value
        icon = builder.icon
        name = builder.name
        address = builder.address
    }
    
    var description:String {
        let latitude = marker.position.latitude
        let longitude = marker.position.longitude
        return "name : \(name), icon : \(icon),\nmarker (\(latitude):\(longitude))"
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