//
//  ViewController.swift
//  Taxi
//
//  Created by 清野隼史 on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func profileEditScreenTransition(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProfileEditController", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "profileedit") as! ProfileEditController
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func mapScreenTransition(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "MapController", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "map") as! MapController
        self.present(nextView, animated: true, completion: nil)
    }
}

