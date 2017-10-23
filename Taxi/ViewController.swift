//
//  ViewController.swift
//  Taxi
//
//  Created by 清野隼史 on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ud = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let account : [String : String] = [
            "name":"山田太郎",
            "email": "yamada@ate.tm",
            "gender": "男",
            "password": "hoge",
            "account_name": "hoge",
            "different_ok?": "true"
        ]
        ud.set(account, forKey: "accountKey")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var idTextform: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBAction func signIn(_ sender: UIButton) {
    }
    @IBAction func signUp(_ sender: UIButton) {
    }
}

