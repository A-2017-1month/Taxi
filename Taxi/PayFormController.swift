//
//  PayFormController.swift
//  Taxi
//
//  Created by Katsuya Taguchi on 2017/10/26.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class PayFormController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var payForm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.payForm.delegate = self as! UITextFieldDelegate
        self.payForm.becomeFirstResponder()
        self.payForm.keyboardType = UIKeyboardType.numberPad
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toHome(_ sender: UIButton) {
    }
}

