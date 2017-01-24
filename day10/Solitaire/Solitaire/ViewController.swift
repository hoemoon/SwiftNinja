//
//  ViewController.swift
//  Solitaire
//
//  Created by hoemoon on 23/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let newView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
//        self.view.addSubview(newView)
        var soliDeck = SolitaireDeck()
        soliDeck.makeCard()
        let deck:[[String]] = soliDeck.resultArray
        
        var initialPoint = (x:26, y:100)
//        print(deck.count)
        
        for out in deck {
            if (out.count < 8) {
                for inner in out  {
//                    print(initialPoint.x, initialPoint.y)
                    let imageView = UIImageView(frame: CGRect(x: initialPoint.x, y: initialPoint.y, width: 130, height: 150))
                    imageView.image = UIImage(named: inner)
                    self.view.addSubview(imageView)
                    initialPoint.y += 40
                    
                }
                initialPoint.x += 140
                initialPoint.y = 100
            } else {
                initialPoint.x = 26
                initialPoint.y = 500
                for inner2 in out {
                    
//                    print(initialPoint.x, initialPoint.y)
                    let imageView = UIImageView(frame: CGRect(x: initialPoint.x, y: initialPoint.y, width: 130, height: 150))
                    imageView.image = UIImage(named: inner2)
                    self.view.addSubview(imageView)
                    initialPoint.x += 24
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }


}

