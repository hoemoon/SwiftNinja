//
//  ViewController.swift
//  Convertor
//
//  Created by hoemoon on 11/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func actionTextField(_ sender: Any) {
        print("Hello")
    }
    @IBAction func convertButton(_ sender: Any) {
        
        var measured = Measurement(value: Double(textField.text!)!, unit: UnitTemperature.celsius)
        measured.convert(to: UnitTemperature.fahrenheit)
        measured.value.round()
        resultLabel.text = String(describing: measured)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

