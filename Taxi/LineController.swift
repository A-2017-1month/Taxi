//
//  LineController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/25.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit

class LineController: UIViewController, MKMapViewDelegate {

    let ud = UserDefaults.standard
    var user: [String : String] = [:]
    var match_user: [String : String] = [:]
    var station: [String : String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        user = ud.object(forKey: "accountKey") as! [String : String]
        match_user = ud.object(forKey: "resultKey") as! [String : String]
        station = DummyStation.stations[0]
         mapLine.delegate = self
        // Do any additional setup after loading the view, typically from a nib.

        var longitude = Double(user["end_longitude"] as! String)
        var latitude  = Double(user["end_latitude"] as! String)
        let coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        let span = MKCoordinateSpanMake(0.015, 0.015)
        let region = MKCoordinateRegionMake(coordinate, span)

        var station_annotation = MKPointAnnotation()
        longitude = Double(station["longitude"] as! String)
        latitude  = Double(station["latitude"] as! String)
        station_annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        station_annotation.title = station["name"] as! String
        mapLine.addAnnotation(station_annotation)

        var user_annotation = MKPointAnnotation()
        longitude = Double(user["end_longitude"] as! String)
        latitude  = Double(user["end_latitude"] as! String)
        user_annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        user_annotation.title = (user["name"]! + "さんの目的地") as! String
        mapLine.addAnnotation(user_annotation)

        var match_user_annotation = MKPointAnnotation()
        longitude = Double(match_user["end_longitude"] as! String)
        latitude  = Double(match_user["end_latitude"] as! String)
        match_user_annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        match_user_annotation.title = (match_user["name"]! + "さんの目的地") as! String
        mapLine.addAnnotation(match_user_annotation)

        getRoute(userLocation: station_annotation.coordinate,destLocation: user_annotation.coordinate)
        getRoute(userLocation: user_annotation.coordinate,destLocation: match_user_annotation.coordinate)
        mapLine.setRegion(region, animated:true)
    }

    func getRoute(userLocation: CLLocationCoordinate2D, destLocation: CLLocationCoordinate2D){
        // 現在地と目的地のMKPlacemarkを生成
        var fromPlacemark = MKPlacemark(coordinate:userLocation, addressDictionary:nil)
        var toPlacemark   = MKPlacemark(coordinate:destLocation, addressDictionary:nil)

        // MKPlacemark から MKMapItem を生成
        var fromItem = MKMapItem(placemark:fromPlacemark)
        var toItem   = MKMapItem(placemark:toPlacemark)

        // MKMapItem をセットして MKDirectionsRequest を生成
        let request = MKDirectionsRequest()

        request.source = fromItem
        request.destination = toItem
        request.requestsAlternateRoutes = false // 単独の経路を検索
        request.transportType = MKDirectionsTransportType.any

        let directions = MKDirections(request:request)
        directions.calculate(completionHandler: { (response, error) in
            let route: MKRoute = response!.routes[0] as MKRoute
            // 経路を描画
            self.mapLine.add(route.polyline)
            })
    }
    @IBOutlet weak var mapLine: MKMapView!
    var num: Int = 0
    func mapView(_ mapLine: MKMapView!, rendererFor overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKPolyline {
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = (num == 0 ? UIColor.blue : UIColor.green)
            num += 1
            num %= 2
            polylineRenderer.lineWidth = 1
            return polylineRenderer
        }
        return nil
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backHome(_ sender: UIButton) {
    }
}
