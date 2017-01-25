//
//  ViewController.swift
//  Solitaire
//
//  Created by hoemoon on 23/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tempIVArrray: [UIImageView] = [UIImageView]()
    var soliDeck: SolitaireDeck = SolitaireDeck()
    override func viewDidLoad() {
        super.viewDidLoad()
        initCardDeck()
        let button = UIButton(frame: CGRect(x: 900, y: 500, width: 100, height: 40))
        button.setTitle("random", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.addTarget(self, action: #selector(randomButton), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func randomButton() {
        soliDeck = SolitaireDeck()
        soliDeck.makeCard()
        let deck: [[String]] = soliDeck.resultArray
        var count = 0
        for out in deck {
            for inner in out {
                tempIVArrray[count].image = UIImage(named: inner)
                count += 1
            }
        }
    }
    func initCardDeck() {
        var soliDeck = SolitaireDeck()
        soliDeck.makeCard()
        let deck: [[String]] = soliDeck.resultArray
        var initialPoint = (x:26, y:100)
        for out in deck {
            if out.count < 8 {
                for inner in out {
                    let imageView = UIImageView(frame:
                        CGRect(x: initialPoint.x, y: initialPoint.y, width: 130, height: 150))
                    imageView.image = UIImage(named: inner)
                    imageView.alpha = 0.5
                    self.view.addSubview(imageView)
                    initialPoint.y += 40
                    tempIVArrray.append(imageView)
                }
                initialPoint.x += 140
                initialPoint.y = 100
            } else {
                initialPoint.x = 26
                initialPoint.y = 500
                for inner2 in out {
                    let imageView = UIImageView(frame:
                        CGRect(x: initialPoint.x, y: initialPoint.y, width: 130, height: 150))
                    imageView.image = UIImage(named: inner2)
                    self.view.addSubview(imageView)
                    initialPoint.x += 24
                    tempIVArrray.append(imageView)
                }
            }
        }
    }
}
