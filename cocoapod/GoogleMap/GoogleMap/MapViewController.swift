//
//  MapViewController.swift
//  GoogleMap
//
//  Created by dev.bamssong on 2016. 1. 6..
//  Copyright © 2016년 bamssong. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GMSMapViewDelegate ,GMSAutocompleteViewControllerDelegate{
    var markerInfos = [MarkerInfo]()
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var printDataLabel: UILabel!
   
    
    @IBAction func clickedSearch(sender: UIBarButtonItem) {
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        self.presentViewController(acController, animated: true, completion: nil)
    }
    
    
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
            (latitude: 37.522831,longitude: 127.025183)
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
        let markerInfo = MarkerInfo(latitude: coordinate.latitude, longitude: coordinate.longitude, builder: MarkerInfoBuilder{ builder in
            })
        markerInfo.marker.map = mapView
        
        //show view - info
        
        //add marker (done?)
        markerInfos.append(markerInfo)
    }
    
    func mapView(mapView: GMSMapView!, didTapMarker marker: GMSMarker!) -> Bool {
        print("didTapMarker")
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
                printDataLabel.text = markerInfo.description
            }
        }
        
        return true
    }
    
    // MARK: - GMSAutocompleteViewControllerDelegate
    func viewController(viewController: GMSAutocompleteViewController!, didAutocompleteWithPlace place: GMSPlace!) {
       
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(place.coordinate) { (reponse, error) in
            let address = reponse.firstResult()
            print(address)
            //create marker
            let markerInfo = MarkerInfo(latitude: place.coordinate.latitude, longitude: place.coordinate.longitude, builder: MarkerInfoBuilder{ builder in
                builder.name = place.name
                builder.address = address.lines.description
                //builder.address = address.locality
                })
            markerInfo.marker.map = self.mapView
            
            //move
            let point = self.mapView.projection.pointForCoordinate(markerInfo.marker.position)
            let newPoint = self.mapView.projection.coordinateForPoint(point)
            let camera = GMSCameraUpdate.setTarget(newPoint)
            self.mapView.animateWithCameraUpdate(camera)

            
            self.markerInfos.append(markerInfo)
        }
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func viewController(viewController: GMSAutocompleteViewController!, didFailAutocompleteWithError error: NSError!) {
        print("Error: \(error.description)")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func wasCancelled(viewController: GMSAutocompleteViewController!) {
        print("Autocomplete was cancelled.")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}