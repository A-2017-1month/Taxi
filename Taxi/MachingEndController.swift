//
//  MachingEndController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit

class MachingEndController: UIViewController {

    let ud = UserDefaults.standard
    let myMapView = MKMapView()
    var match_user: [String : String] = [:]
    @IBOutlet weak var AnnounceLabel: UILabel!
    @IBOutlet weak var matchingUserName: UILabel!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        match_user = ud.object(forKey: "resultKey") as! [String : String]
        AnnounceLabel.text = (match_user["name"]! + "さんはここにいます") as! String

        let user = ud.object(forKey: "accountKey") as! [String : String]
        var longitude = Double(user["longitude"] as! String)
        var latitude  = Double(user["latitude"] as! String)
        let coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        let span = MKCoordinateSpanMake(0.002, 0.002)
        let region = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(region, animated:true)

        var annotation = MKPointAnnotation()
        longitude = Double(user["longitude"] as! String)
        latitude  = Double(user["latitude"] as! String)
        annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        annotation.title = "現在地" as! String
        self.mapView.addAnnotation(annotation)

        annotation = MKPointAnnotation()
        longitude = Double(match_user["longitude"] as! String)
        latitude  = Double(match_user["latitude"] as! String)
        annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        annotation.title = (match_user["name"]! + "さんの現在地") as! String
        self.mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
