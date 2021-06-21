//
//  ViewController.swift
//  CoreLocation
//
//  Created by Henrique Matheus Alves Pereira on 16/04/21.
//

import UIKit
import CoreLocation
import MapKit

class MapKitViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: UIView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locationManager.delegate = self
        locationManager.requestWhenInUserAuthorization()
    }
    
    func locationManager(manager:CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            
            mapView.showsUserLocation = true
            
            if let location = locationManager.location?.coordinate{
                mapView.setCenterCoordinate(location, animated: true)}else{
                    locationManager.startUpdatingLocation()
            }
        }
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocation locations: [AnyObject]!){
        locationManager.stopUpdatingLocation()
        
        if let location = locations.last as? CLLocation {
            mapView.setCenterCoordinate(location.coordinate, animated: true)
            mapView.camera.altitude = pow(2, 11)
        }
    }

}

