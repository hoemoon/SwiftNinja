//
//  MyModel.swift
//  day8
//
//  Created by hoemoon on 17/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct MyModel {
    var jsonArray: Array<[String:Any]> = Array<[String:Any]>()
    
    
    mutating func makeJSONArray(jsonData: Data) {
        jsonArray = try! JSONSerialization.jsonObject(with: jsonData, options: []) as! Array<[String : Any]>
    }
    
    func item(atIndex: Int) -> [String:Any] {
        return jsonArray[atIndex]
    }
}
