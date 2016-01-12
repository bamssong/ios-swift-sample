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
    var markerInfos = [MarkerInfo]()
    
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //https://developers.google.com/maps/documentation/ios-sdk/start?hl=ko
        let camera = GMSCameraPosition.cameraWithLatitude(37.522831,longitude: 127.027183, zoom: 14)
        mapView.delegate = self
        mapView.camera = camera
        mapView.myLocationEnabled = true
        
        
        
        //create marker
        let markerInfo = MarkerInfo(latitude: 37.523831, longitude: 127.023183, builder: MarkerInfoBuilder{ builder in
            builder.name = "테스트 상가"
            builder.address = "주소"
        })
        markerInfo.marker.map = mapView
        
        //create markers
        let sampleDataList = [
            (latitude: 37.522831,longitude: 127.023183),
            (latitude: 37.522831,longitude: 127.024183),
            (latitude: 37.522831,longitude: 127.025183),
            (latitude: 37.522831,longitude: 127.026283),
            (latitude: 37.522831,longitude: 127.027383),
            (latitude: 37.522831,longitude: 127.028483)
        ]
        
        for data in sampleDataList {
            let markerInfo = MarkerInfo(latitude: data.latitude, longitude: data.longitude,
                builder: MarkerInfoBuilder{ builder in
                builder.name = "테스트 상가"
                builder.address = "주소"
                })
            markerInfo.marker.map = mapView

            markerInfos.append(markerInfo)
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
        let markerInfo = MarkerInfo(latitude: 37.523831, longitude: 127.023183, builder: MarkerInfoBuilder{ builder in
            })
        markerInfo.marker.map = mapView
        
        //show view - info
        
        //add marker (done?)
        markerInfos.append(markerInfo)
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        mapView.selectedMarker = marker
        
        //move
        let point = mapView.projection.pointForCoordinate(marker.position)
        let newPoint = mapView.projection.coordinateForPoint(point)
        let camera = GMSCameraUpdate.setTarget(newPoint)
        mapView.animateWithCameraUpdate(camera)
        
        //info
        for markerInfo in markerInfos {
            if(markerInfo.marker == marker){
                //same
                print(markerInfo)
            }
        }
        
        return true
    }

}
