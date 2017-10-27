//
//  ViewController.swift
//  Taxi
//
//  Created by 清野隼史 on 2017/10/22.
//  Copyright © 2017年 清野隼史. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var logoImageView: UIImageView!
    
    let ud = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        ud.set(DummyUser.account,forKey: "accountKey")
        idTextform.delegate = self
        passWord.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor.white
        
        //imageView作成
        self.logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 375 * 1.5, height: 667 * 1.5))
        //画面centerに
        self.logoImageView.center = self.view.center
        //logo設定
        self.logoImageView.image = UIImage(named: "screen.png")
        //viewに追加
        self.view.addSubview(self.logoImageView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //少し縮小するアニメーション
        UIView.animate(withDuration: 0.3,
                                   delay: 1.0,
                                   options: UIViewAnimationOptions.curveEaseOut,
                                   animations: { () in
                                    self.logoImageView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { (Bool) in
            
        })
        
        //拡大させて、消えるアニメーション
        UIView.animate(withDuration: 0.2,
                                   delay: 1.3,
                                   options: UIViewAnimationOptions.curveEaseOut,
                                   animations: { () in
                                    self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                    self.logoImageView.alpha = 0
        }, completion: { (Bool) in
            self.logoImageView.removeFromSuperview()
        })
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

