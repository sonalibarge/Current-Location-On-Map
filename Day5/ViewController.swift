//
//  ViewController.swift
//  Day5
//
//  Created by Sonali on 1/4/18.
//  Copyright © 2018 leftrightmind. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController ,CLLocationManagerDelegate{
    var manager = CLLocationManager()
    let newPin = MKPointAnnotation()
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //Access the last object from locations to get perfect current location
        if let location = locations.last {
            let span = MKCoordinateSpanMake(0.00775, 0.00775)
            let myLocation = CLLocationCoordinate2DMake(location.coordinate.latitude,location.coordinate.longitude)
            let region = MKCoordinateRegionMake(myLocation, span)
            mapView.setRegion(region, animated: true)
            newPin.coordinate = location.coordinate
            mapView.addAnnotation(newPin)
        }
        self.mapView.showsUserLocation = true
        manager.stopUpdatingLocation()
    }
    @IBAction func myLocationButtonClick(_ sender: Any) {
        if CLLocationManager.locationServicesEnabled(){
            manager = CLLocationManager()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestAlwaysAuthorization()
            manager.startUpdatingLocation()
            mapView.showsUserLocation = true
        }
    }
    
}

