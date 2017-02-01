//
//  main.swift
//  RandomNameMachine
//
//  Created by hoemoon on 24/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

let firstNameURL = "http://random.scloudy.com/first_names.json"
let lastNameURL = "http://random.scloudy.com/last_names.json"

func getJSON(urlString: String) -> [[String: Any]] {
    var result: [[String: Any]] = [[String: Any]]()
    URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: urlString)!) { (data, response, error) in
        if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [[String: Any]] {
            // print(json!)
            result = json!
        }
    }.resume()
    sleep(2)
    return result
}

func getName(allJSON: [[String: Any]], position: String) -> String {
    if position == "first" {
        return allJSON[Int(arc4random_uniform(UInt32(allJSON.count)))]["first_name"] as! String
    } else {
        return allJSON[Int(arc4random_uniform(UInt32(allJSON.count)))]["last_name"] as! String
    }
}

print("Hello Random name machine. It will take 2 second.")


print(getName(allJSON: getJSON(urlString: lastNameURL), position: "last"), getName(allJSON: getJSON(urlString: firstNameURL), position: "first"), separator: "")
