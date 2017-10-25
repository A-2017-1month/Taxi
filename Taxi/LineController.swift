//
//  LineController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/25.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit

class LineController: UIViewController {

    let ud = UserDefaults.standard
    var user: [String : String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        user = ud.object(forKey: "accountKey") as! [String : String]

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var mapLine: MKMapView!
    @IBAction func backHome(_ sender: UIButton) {
    }

}
