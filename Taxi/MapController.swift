//
//  MapController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController {
    
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
    }
}
