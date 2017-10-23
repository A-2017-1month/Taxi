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
    @IBOutlet weak var AnnounceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let user = ud.object(forKey: "resultKey") as! [String : String]
        AnnounceLabel.text = (user["name"]! + "さんはここにいます") as! String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var matchingUserName: UILabel!
    @IBOutlet weak var mapView: MKMapView!
}
