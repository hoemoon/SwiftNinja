//
//  DetailViewController.swift
//  CamClient
//
//  Created by hoemoon on 24/03/2017.
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
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let task = URLSession(configuration: URLSessionConfiguration.default).streamTask(withHostName: "127.0.0.1", port: 8000)
        task.readData(ofMinLength: 0, maxLength: 100000, timeout: 1000) { (data, bool, error) in
            print(data)
        }
        task.resume()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Int? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

