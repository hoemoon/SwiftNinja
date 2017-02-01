//
//  ThirdViewController.swift
//  day8
//
//  Created by hoemoon on 18/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    let jsonData = "[{\"title\":\"\u{c0c8}\u{b85c}\",\"image\":\"01.jpg\", \"content\":\"\u{c601}\u{d654}\u{bcf4}\u{b7ec}\u{ac00}\u{c790}\",\"comments\": [{\"id\":1,\"user\":\"jobs\",\"comment\":\"apple\"},{\"id\":4,\"user\":\"cook\", \"comment\":\"apple\"}]}, {\"title\":\"\u{d1a0}\u{c774}\u{c2a4}\u{d1a0}\u{b9ac} \",\"image\":\"02.jpg\", \"content\":\"Pixar\",\"comments\":[]}, {\"title\": \"ToyStory\",\"image\":\"03.jpg\",\"content\":\"\u{c6b0}\u{b514}\u{ac00} \u{cd5c}\u{ace0}\",\"comments\":[{\"id\":2,\"user\":\"bill\",\"comment\": \"Microsoft\"}]}, {\"title\":\"\u{adf9}\u{c7a5}\u{c740}\",\"image\":\"04.jpg\", \"content\":\"\u{c5b4}\u{b514}\u{b85c}\",\"comments\":[{\"id\":4,\"user\": \"cook\",\"comment\":\"apple\"}]}]".data(using: .utf8)
    var randomItem: [String:Any] = [String:Any]()

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = "버튼 누르면 랜덤하게 만들어 줌"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var model = MyModel()
        model.makeJSONArray(jsonData: jsonData!)
        randomItem = model.item(atIndex: Int(arc4random_uniform(4)))

        if segue.identifier == "photoSeque" {
            let pvc : PhotoDetailViewController = segue.destination as! PhotoDetailViewController
            
            for (key, value) in randomItem {
                print(key, value)
                if key == "title" {
                    pvc.titleString = value as! String
                }
                
                if key == "image" {
                    pvc.imageName = value as! String
                }
                if key == "content" {
                    pvc.contentString = value as! String
                }
                if key == "comments" {
                    pvc.numberOfComment = String((value as AnyObject).count)
                }
                
            }
            
        } else {
            print("이상허다")
        }
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
