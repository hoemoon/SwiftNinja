//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by hoemoon on 16/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stocks: [String:[Beverage]]
    
    init() {
        stocks = [String:[Beverage]]()
    }
    
    func add(beverage: Beverage) {
        if let number = stocks[beverage.getName()] {
            if number.count > 0 {
                stocks[beverage.getName()]!.append(beverage)
            }
        } else {
            var temp = [Beverage]()
            temp.append(beverage)
            stocks[beverage.getName()] = temp
        }
//        NotificationCenter.default.post(name: Notification.Name("added"), object: nil)
        NotificationCenter.default.post(name: Notification.Name("added"), object: nil, userInfo: getStockDict())
    }
    
    func getStockDict() -> [String:Int] {
        var tempDict = [String:Int]()
        for (key, value) in stocks {
            tempDict[key] = value.count
        }
        return tempDict
    }
    
    func setStock(stored: [String:Int]) {
        var temp = [String:[Beverage]]()
        for (key, value) in stored {
            var tempArray = [Beverage]()
            for _ in 1...value {
                let soda = Soda(name: key)
                tempArray.append(soda)
            }
            temp[key] = tempArray
        }
        stocks = temp
    }
    
    func printStocks() {
        print("stocks", stocks)
    }
}
