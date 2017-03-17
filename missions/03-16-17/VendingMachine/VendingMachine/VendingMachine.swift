//
//  VendingMachine.swift
//  VendingMachine
//
//  Created by hoemoon on 16/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class VendingMachine {
    private var stocks: [Beverage]
    private var cash: Int
    private var stocksDict: [String:Int]
    
    init() {
        stocks = [Beverage]()
        cash = Int()
        stocksDict = [String:Int]()
    }
    
    func add(beverage: Beverage) {
        stocksDict[beverage.getName()] = beverage.getPrice()
    }
    
    func getNamesOfStocks() -> [String] {
        // set을 쓰면 있는 녀석들 이름을 알 수 있다.
        var tempSet = Set<String>()
        for item in stocks {
            tempSet.insert(item.getName())
        }
        return Array(tempSet)
    }
    
    func getBeveragePrice(name: String) -> Int {
        let filtered = stocks.filter { $0.getName() == name }
        return filtered[0].getPrice()
    }
    
    // [음료이름:재고]
    func getAllStocks() -> [String:Int] {
        // 각각을 필터링 하면 됨.
        var tempDict = [String:Int]()
        for item in getNamesOfStocks() {
            let filtered:[Beverage] = stocks.filter { $0.getName() == item }
            tempDict[filtered[0].getName()] = filtered.count
        }
        stocksDict = tempDict
        return tempDict
    }
    
    func getAvailable(price: Int) -> [String] {
        var tempArray = [String]()
        for item in getNamesOfStocks() {
            if getBeveragePrice(name: item) <= price {
                tempArray.append(item)
            }
        }
        return tempArray
    }
    
    // 전체 구매 목록
    // return: [[name:price]]

    
    // 한 개 구매
    func buy(name: String, inputPrice: Int, amount: Int) {
        // 구매 가능한 아이템인지 확인
        if getAvailable(price: inputPrice).contains(name) != false {
            return
        }
        // 구매 가능한만큼의 돈을 넣었는지 확인
        if getBeveragePrice(name: name) * amount > inputPrice {
            return
        }
        // 통과
        
    }
}
