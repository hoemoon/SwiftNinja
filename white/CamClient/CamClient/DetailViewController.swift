//
//  DetailViewController.swift
//  CamClient
//
//  Created by hoemoon on 06/02/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var camImageView: UIImageView!


    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail
            }
        }
    }

    

    override func viewDidLoad() {
        var imageLength = 0
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        let task = URLSession(configuration: URLSessionConfiguration.default).streamTask(withHostName: "127.0.0.1", port: 8000)

        task.readData(ofMinLength: 0, maxLength: 8, timeout: 100) { (data, atEOF, error) in
            
            
            if let string = String(data: data!, encoding: String.Encoding.utf8) {
                imageLength = Int(string)!
            }
            task.readData(ofMinLength: 0, maxLength: 30000, timeout: 100, completionHandler: { (data, atEOF, error) in
                print("raw", data!)
                if let data = data {
                    self.camImageView.image = UIImage(data: data.subdata(in: 9..<imageLength))
                    print(UIImage(data: data.subdata(in: 9..<imageLength)))
                }
            })
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

