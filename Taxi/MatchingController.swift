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
    var current = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        GenderLabel.text = DummyUser.users[current]["gender"]
        NameLabel.text = DummyUser.users[current]["name"]
        priceLabel.text = DummyUser.users[current]["price"]!+"円お得になります！"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backPage(_ sender: UIButton) {
    }

    @IBOutlet weak var priceLabel: UILabel!

    @IBAction func matchingDo(_ sender: UIButton) {
        ud.set(DummyUser.users[current], forKey: "resultKey")
    }

    @IBAction func matchingNot(_ sender: UIButton) {
        current += 1
        current %= DummyUser.users.count
        self.viewDidLoad()
    }
}
