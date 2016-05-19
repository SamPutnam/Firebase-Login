//
//  MapViewController.swift
//  Homesafe
//
//  Created by Samuel Putnam on 5/17/16.
//  Copyright © 2016 Sam Putnam. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

//need ViewController to conform to these two delegates (the protocol)

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    //An MKMapView object provides an embeddable map interface, similar to the one provided by the Maps application. You use this class as-is to display map information and to manipulate the map contents from your application. You can center the map on a given coordinate, specify the size of the area you want to display, and annotate the map with custom information.
    @IBOutlet weak var mapView: MKMapView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SwitchAccount(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    


    //create a locationManager property
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //set up locationManager so it can find current location as soon as it's loaded.
        // delegate is the delegate object to receive update events. Self returns the receiver
        self.locationManager.delegate = self
        // Use the second highest level of accuracy
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // Requests permission to use location services while the app is in the foreground, we don't want to use location services when the app is in the background
        self.locationManager.requestWhenInUseAuthorization()
        // Starts the generation of updates that report the user's current location
        self.locationManager.startUpdatingLocation()
        // A boolean value indicating whether the map should try to display the user's location
        self.mapView.showsUserLocation = true
        
    }
    
    
    // MARK - Location Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Get last location of locations that have been passed in (most current)
        let location = locations.last
        // For future use
        print(location!.coordinate.latitude)
        print(location!.coordinate.longitude)
        // Get center of that location, i.e. latitude and longitude from that location variable
        let center =  CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        //  Area for map to zoom to. A smaller number zooms further in. Zooming into user's current location. MKCoordinateRegion is a structure which defines which portion of the map to display; center is the centerpoint of the region displayed. The span defines the horizontal and vertical span representing the amount of map to display. The span also defines the current zoom level used by the map view object. 1 and 1 is the zoom.
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta:1, longitudeDelta: 1))
        // change currently visible region to that region and animate this change
        self.mapView.setRegion(region, animated: true)
        //Stop the generation of location updates.
        self.locationManager.stopUpdatingLocation()
    }
    
    
    //manager is the location manager object that was unable to retrieve the location; error is the error object containing the reason the location or heading could not be retrieved.
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print ("Errors: "  + error.localizedDescription)
    }
    
}

