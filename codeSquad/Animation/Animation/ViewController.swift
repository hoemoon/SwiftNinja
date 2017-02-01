//
//  ViewController.swift
//  Animation
//
//  Created by hoemoon on 01/02/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var aniView =  UIView()
    var toggle = 0
    var tempArray = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        aniView = UIView(frame: CGRect(x: 120, y: 200, width: 100, height: 100))
        let button = UIButton(frame: CGRect(x: 140, y: 50, width: 50, height: 50))
        let getButton = UIButton(frame: CGRect(x: 140, y: 300, width: 50, height: 50))
        let downButton = UIButton(frame: CGRect(x: 140, y: 400, width: 50, height: 50))
        
        button.backgroundColor = UIColor.gray
        button.setTitle("JUMP", for: UIControlState.normal)
        aniView.backgroundColor = UIColor.brown
        button.addTarget(self, action: #selector(completeMoveView), for: UIControlEvents.touchUpInside)
        
        getButton.backgroundColor = UIColor.green
        getButton.setTitle("GET", for: UIControlState.normal)
        getButton.addTarget(self, action: #selector(getJSON), for: UIControlEvents.touchUpInside)
        
        downButton.backgroundColor = UIColor.magenta
        downButton.setTitle("DOWN", for: UIControlState.normal)
        downButton.addTarget(self, action: #selector(downLoad), for: UIControlEvents.touchUpInside)
    
        view.addSubview(aniView)
        view.addSubview(button)
        view.addSubview(getButton)
        view.addSubview(downButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downLoad() {
        let cacheDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        let preUrl = "http://125.209.194.123/demo/"
        for item in tempArray {
            let url = preUrl + String(describing: item["image"]!)
            let localLocation = URL(string: cacheDir)?.appendingPathComponent(item["image"] as! String).path
            URLSession(configuration: URLSessionConfiguration.default).downloadTask(with: URL(string: url)!, completionHandler: { (tempLocalLocation, response, error) in
                print("here")
                print(tempLocalLocation!)
                
                do {
                    try FileManager.default.copyItem(at: tempLocalLocation!, to: URL(fileURLWithPath: localLocation!))
                } catch (let writeError) {
                    print(writeError)
                }
                
            }).resume()
        }
        
        
    }
    
    func getJSON() {
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "http://125.209.194.123/json.php")!) {
            (data, response, error) in
            
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            
            if let array = json as? [[String: String]] {
                self.tempArray = array
            }
            
        }.resume()
        
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0])

    }
    
    func moveView() {
        if toggle == 0 {
            UIView.animate(withDuration: 1, animations: {
                self.aniView.frame = CGRect(x: 120, y: 300, width: 200, height: 200)
                self.aniView.backgroundColor = UIColor.red
            })
            toggle = 1
            
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.aniView.frame = CGRect(x: 120, y: 200, width: 100, height: 100)
                self.aniView.backgroundColor = UIColor.yellow

            })
            toggle = 0
        }
    }
    
    func completeMoveView() {
        UIView.animate(withDuration: 1, animations: {
            self.aniView.frame = CGRect(x: 200, y: 200, width: 10, height: 10)
            self.aniView.backgroundColor = UIColor.yellow

        }, completion: { (complete: Bool) in
            self.aniView.frame = CGRect(x: 10, y: 200, width: 300, height: 300)
            self.aniView.backgroundColor = UIColor.cyan
        })
    }
}

