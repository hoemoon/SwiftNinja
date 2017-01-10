//
//  StructPractice.swift
//  day0110
//
//  Created by hoemoon on 10/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct InterestManager {

    func getInterestRate(byDay: Int) -> Double {
        switch byDay {
        case 0 ... 90 :
            return 0.5
        case 91..<180:
            return 1
        case 180..<365:
            return 2
        default:
            return 5.6
        }
    }
    
    func calculateAmount(day: Int, amount: Int) -> Double {
        let calculated = Double(amount) * (getInterestRate(byDay: day) / 100)
        // 원금 + 이자
        return Double(amount) + calculated
    }
    
}
