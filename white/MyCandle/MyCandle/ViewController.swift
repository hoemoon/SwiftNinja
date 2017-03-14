//
//  ViewController.swift
//  MyCandle
//
//  Created by hoemoon on 11/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var toggle:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad")
    }
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var candleImageView: UIImageView!
    
    @IBAction func buttonTouched(_ sender: Any) {
//        let button = sender as! UIButton

        candleImageView.image = UIImage(named: "candleOn.jpeg")

        
        if toggle == 0 {
            print(toggle)
            candleImageView.image = UIImage(named: "candleOff.jpeg")
            toggle = 1
        } else {
            candleImageView.image = UIImage(named: "candleOn.jpeg")
            print(toggle)
            toggle = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view Will Disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

