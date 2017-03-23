//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by hoemoon on 23/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomTop: NSLayoutConstraint!
    @IBOutlet weak var splitViewY: NSLayoutConstraint!
    
    var currentY = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.responseToPanGesture))
        splitViewY.constant = self.view.bounds.midY
        self.splitView.addGestureRecognizer(panRecognizer)
    }
    
    func responseToPanGesture(rec: UIPanGestureRecognizer) {
        splitViewY.constant = rec.location(in: self.view).y
        print(currentY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

