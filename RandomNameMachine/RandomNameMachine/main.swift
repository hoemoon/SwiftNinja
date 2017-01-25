//
//  main.swift
//  RandomNameMachine
//
//  Created by hoemoon on 24/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

print("Hello")

var shouldKeepRunning = true        // global

URLSession(configuration: URLSessionConfiguration.default).dataTask(with: URL(string: "http://apple.com")!) { (data, response, error) in
    var resultHTML = String(data: data!, encoding: String.Encoding.utf8)
    print(resultHTML)
    shouldKeepRunning = false
    }.resume()

while shouldKeepRunning && RunLoop.current.run(mode: .defaultRunLoopMode, before: .distantFuture) {
    
}
