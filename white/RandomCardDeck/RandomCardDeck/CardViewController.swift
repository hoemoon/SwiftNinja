//
//  CardViewController.swift
//  RandomCardDeck
//
//  Created by hoemoon on 19/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
//    var rTuple: (key: String, val: String)? = nil
    var rTuple:(key: String, val: String) = ("","")
    @IBOutlet weak var shapeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(rTuple.key, rTuple.val)
        shapeLabel.text = rTuple.key
        numberLabel.text = rTuple.val
        cardImageView.image = UIImage(named: rTuple.key + rTuple.val)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
