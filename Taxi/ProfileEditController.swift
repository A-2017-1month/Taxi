//
//  ProfileEditController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit

class ProfileEditController: UIViewController {
  
    @IBOutlet weak var AddressLabel: UILabel!
    let myMapView = MKMapView()
    let ud = UserDefaults.standard
    var user : [String : String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        user = ud.object(forKey: "accountKey") as! [String : String]
        var longitude = Double(user["longitude"] as! String)
        var latitude  = Double(user["latitude"] as! String)
        let coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        let span = MKCoordinateSpanMake(0.005, 0.005)
        let region = MKCoordinateRegionMake(coordinate, span)
        self.mapView.setRegion(region, animated:true)
    }

    @IBAction func pressMap(_ sender: UILongPressGestureRecognizer) {
        //マップビュー内のタップした位置を取得する。
        let location:CGPoint = sender.location(in: mapView)
        if (sender.state == UIGestureRecognizerState.ended) {
            //タップした位置を緯度、経度の座標に変換する。
            let mapPoint:CLLocationCoordinate2D = mapView.convert(location, toCoordinateFrom: mapView)
            //ピンを作成してマップビューに登録する。
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(mapPoint.latitude, mapPoint.longitude)
            annotation.title = "ピン"
            annotation.subtitle = "\(annotation.coordinate.latitude), \(annotation.coordinate.longitude)"
            mapView.addAnnotation(annotation)
            AddressLabel.text = user["address"]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var rideLocation: UILabel!

    @IBOutlet weak var mapView: MKMapView!
    @IBAction func machingOnOff(_ sender: UISwitch) {
    }
    @IBAction func customEdit(_ sender: UIButton) {
    }

}
