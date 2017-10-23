//
//  MatchingController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class MatchingController: UIViewController {

    @IBOutlet weak var CommentLabel: UITextField!
    @IBOutlet weak var GenderLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    let ud = UserDefaults.standard
    var list : [[String : String]] = []
    var current = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let user1 = ud.object(forKey: "user1Key") as! [String : String]
        let user2 = ud.object(forKey: "user2Key") as! [String : String]
        list  = [user1, user2]
        CommentLabel.text = list[current]["comment"]
        GenderLabel.text = list[current]["gender"]
        NameLabel.text = list[current]["name"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backPage(_ sender: UIButton) {
    }
    @IBAction func matchingDo(_ sender: UIButton) {
        ud.set(list[current], forKey: "resultKey")
    }
    @IBAction func matchingNot(_ sender: UIButton) {
        current += 1
        current %= 2
    }
}
