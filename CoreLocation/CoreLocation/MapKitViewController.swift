//
//  ViewController.swift
//  CoreLocation
//
//  Created by Henrique Matheus Alves Pereira on 16/04/21.
//

import UIKit
import CoreLocation
import MapKit

class MapKitViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mapView.delegate = self
        
        locationManager.delegate = self
        locationManager.requestWhenInUserAuthorization()
        
        var point = MKPointAnnotation();
        point.coordinate = CLLocationCoordinate2D(37.331507, -122.033354)
        point.title = "Nice restaurant"
        point.subtitle = "Very close to you."
        
        mapView.addAnnotation(point)
        mapView.showAnnotations([point], animated: false)
    }
    
    func locationManager(manager:CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            
            mapView.showsUserLocation = true
            
            if let location = locationManager.location?.coordinate{
                mapView.setCenterCoordinate(location, animated: true)
            } else {
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
    
    func mapView(mapView: MKMapView!, viewAnnotation annotation: MKAnnotation!) -> MKAnnotation! {
        
        var identifier = "CustomAnnotation"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        if annotation.isKind(of: MKPointAnnotation.self){
            var pin = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as! MKPinAnnotationView?
            
            if pin == nil {
                pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                pin!.pinTintColor = .green
                pin!.animatesDrop = true
                pin!.canShowCallout = true
                
                //callout
                var button = UIButton(type: .detailDisclosure) as UIButton
                pin!.leftCalloutAccessoryView = button
                
                var image = UIImageView(image: UIImage(named: "item_check"))
                pin!.rightCalloutAccessoryView = image
                
            } else {
                pin!.annotation = annotation
            }
            return pin
        }
        return nil
    }
    
    private func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        
        if control is UIButton {
            let alert = UIAlertController(title: "Nice restaurant", message: "Welcome!", preferredStyle: UIAlertController.Style.alert)
            let action = UIAlertAction(title: "Thanks!", style: UIAlertAction.Style.cancel, handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
