//
//  ViewController.swift
//  socialNumber
//
//  Created by hoemoon on 25/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var textField: UITextField = UITextField()
    var uiView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let label: UILabel = UILabel(frame: CGRect(x: 20, y: 180, width: 200, height: 30))
        label.text = "SOCIAL NUMBER"
        view.addSubview(label)
        
        textField = UITextField(frame: CGRect(x: 20, y: 210, width: 280, height: 30))
        textField.placeholder = "Enter number ..."
        // textField.backgroundColor = UIColor.blue
        textField.borderStyle = UITextBorderStyle.roundedRect
        view.addSubview(textField)
        
        uiView = UIView(frame: CGRect(x: 20, y: 242, width: 280, height: 5))
        uiView.backgroundColor = UIColor.red
        // uiView.isHidden = true
        view.addSubview(uiView)
        
        let button: UIButton = UIButton(frame: CGRect(x: 20, y: 249, width: 70, height: 30))
        button.setTitle("CHECK", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(checkButton), for: UIControlEvents.touchUpInside)
        button.setTitleShadowColor(UIColor.brown, for: .normal)
    
        button.tintColor = UIColor.cyan
        
        view.addSubview(button)
    }
    
    func checkButton() {
        if checkNumber(input: textField.text!) == true {
            uiView.backgroundColor = UIColor.green
        } else {
            uiView.backgroundColor = UIColor.red
        }
    }
    
    func convertToNumberArray(input: String) -> [Int] {
        var intArray = [Int]()
        
        for i in input.characters {
            let someString = String(i)
            
            if let someInt = Int(someString) {
                intArray += [someInt]
            }
        }
        return intArray
    }
    
    func checkNumber(input: String) -> Bool {
        let originalNumberArray = convertToNumberArray(input: input)
        if originalNumberArray.count < 13 {
            return false
        }
        var convertalbeNumberArray = [2,3,4,5,6,7,8,9,2,3,4,5]
        
        let sevenNumber = originalNumberArray[12]
        var numberN = 0
        
        print(originalNumberArray, convertalbeNumberArray)
        
        for index in 0...convertalbeNumberArray.count - 1 {
            numberN += originalNumberArray[index] * convertalbeNumberArray[index]
        }
        print(numberN)
        let k = (11 - (numberN % 11)) % 10
        print("k", k)
        if k == sevenNumber {
            return true
        } else {
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

