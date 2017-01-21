//
//  FirstViewController.swift
//  day8
//
//  Created by hoemoon on 17/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextViewBtn(_ sender: Any) {
        let nextVC: NextViewController = storyboard?.instantiateViewController(withIdentifier: "nextVC") as! NextViewController
        
        nextVC.titleString = "Hello World"
//        present(nextVC, animated:  true, completion: nil)
        if let navigation = navigationController {
            navigation.pushViewController(nextVC, animated: true)
        }
    }

}
