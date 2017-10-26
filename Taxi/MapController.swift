//
//  MapController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController {
  let ud = UserDefaults.standard
  let myMapView = MKMapView()
  let myLocationManager = CLLocationManager()
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var rideLocation: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    let user = ud.object(forKey: "accountKey") as! [String : String]
    var longitude = Double(user["longitude"] as! String)
    var latitude  = Double(user["latitude"] as! String)
    let coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
    let span = MKCoordinateSpanMake(0.003, 0.003)
    let region = MKCoordinateRegionMake(coordinate, span)
    self.mapView.setRegion(region, animated:true)

    var annotation = MKPointAnnotation()
    longitude = Double(user["longitude"] as! String)
    latitude  = Double(user["latitude"] as! String)
    annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
    annotation.title = "現在地" as! String
    self.mapView.addAnnotation(annotation)

    annotation = MKPointAnnotation()
    longitude = Double(DummyStation.stations[0]["longitude"] as! String)
    latitude  = Double(DummyStation.stations[0]["latitude"] as! String)
    annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
    annotation.title = DummyStation.stations[0]["name"]
    annotation.subtitle = DummyStation.stations[0]["address"]
    self.mapView.addAnnotation(annotation)
    rideLocation.text = DummyStation.stations[0]["address"]
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func editProfile(_ sender: UIButton) {
  }

  @IBAction func selectTime(_ sender: UIDatePicker) {
  }

  @IBAction func customEnd(_ sender: UIButton) {
  }
}
