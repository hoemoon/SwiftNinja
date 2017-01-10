
//  main.swift
//  day0110
//
//  Created by hoemoon on 10/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

let interestManager:InterestManager = InterestManager()

func testInterest(unitDay: Int) {
    var dayArray:[Int] = []
    let amount:Int = 1000000
    
    for i in 1...365 {
        if (i % unitDay == 0) {
            dayArray.append(i)
        }
    }
    
    for index in dayArray {
        
        print("day:", index, "amount: ", interestManager.calculateAmount(day: index, amount: amount))
    }
}

//testInterest(unitDay: 5) 

let arrayPractice:ArrayPractice = ArrayPractice()
//arrayPractice.printArray(array: arrayPractice.tempArray(lines: 5))
//arrayPractice.printArray(array: arrayPractice.fillArray(lines: 5))
//arrayPractice.printArray(array: arrayPractice.setBoolArray(lines: 5), newChar: "#")
arrayPractice.printArray(array: arrayPractice.makeMagicSquare(row: 3))
