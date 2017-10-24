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
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var AddressLabel: UITextView!

    let ud = UserDefaults.standard
    var user : [String : String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        user = ud.object(forKey: "accountKey") as! [String : String]
        NameLabel.text = user["name"] as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var rideLocation: UITextView!
    @IBOutlet weak var mapView: MKMapView!
    @IBAction func machingOnOff(_ sender: UISwitch) {
    }
    @IBAction func customEdit(_ sender: UIButton) {
    }

}
