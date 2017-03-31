//
//  ViewController.swift
//  BookProgress
//
//  Created by hoemoon on 31/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressView.progress = 0
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButton(_ sender: UIButton) {
        DispatchQueue.global().async() {
            self.beginProgress()
        }
    }
    
    func beginProgress() {
        let fileContent = try? String.init(contentsOfFile: Bundle.main.path(forResource: "bookfile", ofType: "txt")!, encoding: String.Encoding.utf8)
        var spaceCount = 0
        var progress: Float = 0
        var nIndex = 0
        let lenght = fileContent?.unicodeScalars.count
        for char in (fileContent?.unicodeScalars)! {
            if char == " ".unicodeScalars.first {
                spaceCount += 1
            }
            
            DispatchQueue.main.async {
                progress = Float(nIndex) / Float(lenght!)
                nIndex += 1
                self.progressView.progress = progress
            }
        }
        
        let alert = UIAlertController.init(title: "Result",
                                           message: "찾았다. \(spaceCount)개", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }

}

