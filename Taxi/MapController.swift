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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func editProfile(_ sender: UIButton) {
    }
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var rideLocation: UITextField!
    @IBAction func selectTime(_ sender: UIDatePicker) {
    }
    @IBAction func customEnd(_ sender: UIButton) {

        let user1 : [String : String] = [
        "name":"田中一郎",
        "email": "tanaka@ate.tm",
        "gender": "男",
        "password": "hoge",
        "account_name": "hoge",
        "different_ok?": "true",
        "comment": "早く帰りたいです"
        ]

        let user2 : [String : String] = [
        "name":"木村和子",
        "email": "kimura@ate.tm",
        "gender": "女",
        "password": "hoge",
        "account_name": "hoge",
        "different_ok?": "true",
        "comment": "少しの時間なら待てます"
        ]

        ud.set(user1, forKey: "user1Key")
        ud.set(user2, forKey: "user2Key")
    }
}
