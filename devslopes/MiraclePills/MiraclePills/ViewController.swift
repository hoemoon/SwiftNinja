//
//  ViewController.swift
//  MiraclePills
//
//  Created by hoemoon on 20/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var countryBtn: UILabel!
    @IBOutlet weak var countryTf: UITextField!
    @IBOutlet weak var zipCodeBtn: UILabel!
    @IBOutlet weak var zipCodeTf: UITextField!
    @IBOutlet weak var successBtn: UIButton!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var buyBtn: UIButton!

    let states = ["Alaska", "Arkansas", "Alabama", "California", "Manie", "New York"]

    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryBtn.isHidden = true
        countryTf.isHidden = true
        zipCodeBtn.isHidden = true
        zipCodeTf.isHidden = true
        buyBtn.isHidden = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryBtn.isHidden = false
        countryTf.isHidden = false
        zipCodeBtn.isHidden = false
        zipCodeTf.isHidden = false
        buyBtn.isHidden = false

    }
    @IBAction func buyBtn(_ sender: Any) {
        whiteView.isHidden = false
        successBtn.isHidden = false
    }
    @IBAction func successAction(_ sender: Any) {
        whiteView.isHidden = true
        successBtn.isHidden = true
    }

}
