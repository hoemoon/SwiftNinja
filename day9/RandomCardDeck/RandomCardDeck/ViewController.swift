//
//  ViewController.swift
//  RandomCardDeck
//
//  Created by hoemoon on 19/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    enum CardFace: UInt32 {
        case d, h, s, c
    }
    var secondArray:[String] = [String]()
    

    @IBAction func randomButton(_ sender: Any) {
        let cardViewController: CardViewController = storyboard?.instantiateViewController(withIdentifier: "cardViewBoard") as! CardViewController
        let randomFace = CardFace(rawValue: arc4random_uniform(4))
        
        for index in 2...14 {
            if index == 11 {
                secondArray.append("A")
            } else if index == 12 {
                secondArray.append("J")
            } else if index == 13 {
                secondArray.append("K")
            } else if index == 14 {
                secondArray.append("Q")
            } else {
                secondArray.append(String(index))
            }
        }
        
        cardViewController.rTuple.key = String(describing: randomFace!)
        cardViewController.rTuple.val = secondArray[Int(arc4random_uniform(4))]
        
//        print(String(describing: randomFace!), secondArray[Int(arc4random_uniform(4))])
        
        if let navigation = navigationController {
            navigation.pushViewController(cardViewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

