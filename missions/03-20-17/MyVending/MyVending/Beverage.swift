//
//  Beverage.swift
//  VendingMachine
//
//  Created by hoemoon on 16/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

class Beverage :NSObject, NSCoding {
    private let maker: String
    private let price: Int
    private let name: String
    private let expireDate: Date
    
    init(maker: String, price: Int, name: String, expireDate: Date) {
        self.maker = maker
        self.price = price
        self.name = name
        self.expireDate = expireDate
    }
    
    convenience override init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()))
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getPrice() -> Int {
        return self.price
    }
    
    override var description: String {
        return self.name
    }
    
    static func ==(lhs: Beverage, rhs: Beverage) -> Bool {
        // return lhs.getName().compare(rhs.getName()) == ComparisonResult.orderedSame && lhs.expireDate == rhs.expireDate
        return lhs.getName() == rhs.getName() && lhs.expireDate == rhs.expireDate
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(maker, forKey: "maker")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(expireDate, forKey: "expireDate")
    }
    
    required init?(coder aDecoder: NSCoder) {
        maker = aDecoder.decodeObject(forKey: "maker") as! String
        price = aDecoder.decodeInteger(forKey: "price")
        name = aDecoder.decodeObject(forKey: "name") as! String
        expireDate = aDecoder.decodeObject(forKey: "expireDate") as! Date
    }
}

class CoolBeverage: Beverage {
    private var caffein: Bool
    private var acidLevel: Int
    
    init(maker: String, price: Int, name: String, expireDate: Date, caffein: Bool, acidLevel: Int) {
        self.caffein = caffein
        self.acidLevel = acidLevel
        super.init(maker: maker, price: price, name: name, expireDate: expireDate)
    }
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), caffein: Bool(), acidLevel: Int())
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(caffein, forKey: "caffein")
        aCoder.encode(acidLevel, forKey: "acidLevel")
    }
    
    required init?(coder aDecoder: NSCoder) {
        caffein = aDecoder.decodeBool(forKey: "caffein")
        acidLevel = aDecoder.decodeInteger(forKey: "acidLevel")
        super.init(coder: aDecoder)
    }
}

class HotBeverage: Beverage {
    private var temperature: Int
    
    init(maker: String, price: Int, name: String, expireDate: Date, temperature: Int) {
        self.temperature = temperature
        super.init(maker: maker, price: price, name: name, expireDate: expireDate)
    }
    
    convenience init() {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), temperature: Int())
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(temperature, forKey: "temperature")
    }
    
    required init?(coder aDecoder: NSCoder) {
        temperature = aDecoder.decodeInteger(forKey: "temperature")
        super.init(coder: aDecoder)
        
    }
}

class Soda: CoolBeverage {
    private var taste: String
    override init(maker: String, price: Int, name: String, expireDate: Date, caffein: Bool, acidLevel: Int) {
        self.taste = String()
        super.init(maker: maker, price: price, name: name, expireDate: expireDate, caffein: caffein, acidLevel: acidLevel)
    }
    
    convenience init(taste: String) {
        self.init(maker: "unknown", price: 0, name: "unknown", expireDate: Date(timeInterval: 30000, since: Date()), caffein: Bool(), acidLevel: Int())
        self.taste = taste
    }
    convenience init(name: String) {
        self.init(maker: "soda inc.", price: 1000, name: name, expireDate: Date(timeInterval: 30000, since: Date()), caffein: true, acidLevel: 100 )
    }
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(taste, forKey: "taste")
    }
    required init?(coder aDecoder: NSCoder) {
        taste = aDecoder.decodeObject(forKey: "taste") as! String
        super.init(coder: aDecoder)
    }
}


