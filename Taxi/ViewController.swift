//
//  ViewController.swift
//  Taxi
//
//  Created by 清野隼史 on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let ud = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        ud.set(DummyUser.account,forKey: "accountKey")
        idTextform.delegate = self
        passWord.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
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

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if (textField == idTextform) {
            passWord?.becomeFirstResponder()
            } else {
                // キーボードを閉じる
                textField.resignFirstResponder()
            }
            return true
        }
    }

