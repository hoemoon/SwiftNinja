//
//  ViewController.swift
//  MyVending
//
//  Created by hoemoon on 20/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachine()
    @IBOutlet weak var cokeCount: UILabel!
    @IBOutlet weak var cidarCount: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//        let coke = Soda(maker: "cocacola inc.", price: 1000, name: "cocacola", expireDate: Date(), caffein: false, acidLevel: 50)
//        let cidar = Soda(maker: "lotte", price: 1000, name: "cidar", expireDate: Date(), caffein: false, acidLevel: 70)
//        vendingMachine.add(beverage: coke)
//        vendingMachine.add(beverage: coke)
//        vendingMachine.add(beverage: cidar)
//        
//        vendingMachine.add(beverage: coke)
//        vendingMachine.printStocks()
        var tempDict = ["cidar": 1, "cocacola": 3]
        vendingMachine.setStock(stored: tempDict)
        print(vendingMachine.getStockDict())

    }
    
//        stocks = vendingMachine.getAllStockDict() ?? [String:Int]()
//        drawView()
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        print("viewWillAppear", stocks)
//        drawView()
//    }
//        
//    func drawView() {
////         stocks = vendingMachine.getAllStocks() ?? [String:Int]()
//        
//        if let coke = stocks["cocacola"] {
//            cokeCount.text = String(describing: coke)
//        }
//        if let cidar = stocks["cidar"] {
//            cidarCount.text = String(describing: cidar)
//        }
//    }
//    
//    func getStocks() -> [String: Int]{
//        return stocks
//    }
//    
//    func setStocks(stocks: [String: Int]) {
//        self.stocks = stocks
//    }
//    
    @IBAction func addCoke(_ sender: Any) {
        let coke = Soda(maker: "cocacola inc.", price: 1000, name: "cocacola", expireDate: Date(), caffein: false, acidLevel: 50)
        vendingMachine.add(beverage: coke)
    }

    @IBAction func addCidar(_ sender: Any) {
        let cidar = Soda(maker: "lotte", price: 1000, name: "cidar", expireDate: Date(), caffein: false, acidLevel: 40)
        vendingMachine.add(beverage: cidar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

