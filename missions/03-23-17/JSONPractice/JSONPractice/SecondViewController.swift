//
//  SecondViewController.swift
//  JSONPractice
//
//  Created by hoemoon on 23/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    func randomJson() {
        let jsonData = "[{\"title\":\"\u{c0c8}\u{b85c}\",\"image\":\"01.jpg\", \"content\":\"\u{c601}\u{d654}\u{bcf4}\u{b7ec}\u{ac00}\u{c790}\",\"comments\": [{\"id\":1,\"user\":\"jobs\",\"comment\":\"apple\"},{\"id\":4,\"user\":\"cook\", \"comment\":\"apple\"}]}, {\"title\":\"\u{d1a0}\u{c774}\u{c2a4}\u{d1a0}\u{b9ac} \",\"image\":\"02.jpg\", \"content\":\"Pixar\",\"comments\":[]}, {\"title\": \"ToyStory\",\"image\":\"03.jpg\",\"content\":\"\u{c6b0}\u{b514}\u{ac00} \u{cd5c}\u{ace0}\",\"comments\":[{\"id\":2,\"user\":\"bill\",\"comment\": \"Microsoft\"}]}, {\"title\":\"\u{adf9}\u{c7a5}\u{c740}\",\"image\":\"04.jpg\", \"content\":\"\u{c5b4}\u{b514}\u{b85c}\",\"comments\":[{\"id\":4,\"user\": \"cook\",\"comment\":\"apple\"}]}]".data(using: .utf8)

        let json = try! JSONSerialization.jsonObject(with: jsonData!, options: [])
        if let array = json as? [[String:Any]] {
            let randomElement = array[Int(arc4random_uniform(4))]
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! PhotoDetailViewController
            if let title = randomElement["title"] {
                detailVC.titleLabeltext = title as! String
            }
            if let content = randomElement["content"] {
                detailVC.contentLabel = content as! String
            }
            if let comments = randomElement["comments"] as? [[String:Any]] {
                print(comments)
                detailVC.commentsLabel = String(comments.count)
            }
            if let image = randomElement["image"] as? String {
                detailVC.imageString = image
            }
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }

    @IBAction func randomAction(_ sender: Any) {
        randomJson()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

