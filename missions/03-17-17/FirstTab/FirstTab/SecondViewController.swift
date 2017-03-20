//
//  SecondViewController.swift
//  FirstTab
//
//  Created by hoemoon on 17/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    var startLocation: Double = Double()
    var initAlpha:Double = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if let touch = touches.first {
            startLocation = Double(touch.location(in: self.view).y)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        if let touch = touches.first {
            let currentY:Double = Double(touch.location(in: self.view).y)
            let diff:Int = Int(abs(startLocation - currentY))
            if diff % 5 == 0 {
                initAlpha -= 0.05
            }
            self.view.backgroundColor = UIColor.yellow.withAlphaComponent(CGFloat(initAlpha))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        initAlpha = 1
        self.view.backgroundColor = UIColor.yellow.withAlphaComponent(CGFloat(initAlpha))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

