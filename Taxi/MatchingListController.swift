//
//  MatchingListController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class MatchingListController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func payEndScreenTransition(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "PayEndController", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "") as! ProfileEditController
        self.present(nextView, animated: true, completion: nil)
    }
    @IBAction func profileScreenTransition(_ sender: UIButton) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProfileEditController", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "profile") as! ProfileEditController
        self.present(nextView, animated: true, completion: nil)
    }
}
