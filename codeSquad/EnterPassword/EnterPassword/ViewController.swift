//
//  ViewController.swift
//  EnterPassword
//
//  Created by hoemoon on 19/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
//    @IBOutlet weak var actionButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        passwordInput.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkButton(_ sender: Any) {
        let level = passwordValidator(password: passwordInput.text!)
        switch level {
        case 2:
            levelView.backgroundColor = UIColor.orange
            descriptionLabel.text = "weak password"
        case 3:
            levelView.backgroundColor = UIColor.yellow
            descriptionLabel.text = "normal password"
        case 4:
            levelView.backgroundColor = UIColor.blue
            descriptionLabel.text = "strong password"
        case 5:
            levelView.backgroundColor = UIColor.green
            descriptionLabel.text = "very strong password"
        default:
            levelView.backgroundColor = UIColor.red
            descriptionLabel.text = "very weak password"
        }
    }
    
    
    func passwordValidator(password: String) -> Int {
        let passwordLength = password.characters.count
        var charCount = 0
        var numberCount = 0
        var neitherCount = 0
        
        let tempChar = password.unicodeScalars
        for scalar in tempChar {
            //        print(scalar.value)
            let ch = scalar.value
            if 97 <= ch && ch <= 122 {
                charCount += 1
            } else if 65 <= ch && ch <= 90 {
                charCount += 1
            } else if 48 <= ch && ch <= 57 {
                numberCount += 1
            } else {
                neitherCount += 1
            }
        }
        
        if passwordLength < 8 {
            if numberCount == passwordLength {
                return 1
            } else if charCount == passwordLength {
                return 2
            }
        } else if passwordLength >= 8 {
            if numberCount > 0 && charCount > 0 && neitherCount > 0 {
                return 5
            } else if numberCount > 0 && charCount > 0 {
                return 4
            }
        }
        return 3
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("changed")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
    }
}

