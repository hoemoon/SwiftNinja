//
//  Solitaire.swift
//  Solitaire
//
//  Created by hoemoon on 23/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct SolitaireDeck {
    var array52: [String] = [String]()
    var secondArray: [String] = [String]()
    var rSecondArray:[String] = [String]()
    var rFace:[String] = [String]()
    var cardFace:[String] = ["d", "h", "s", "c"]
    var resultArray = [[String]]()

    init() {
        for index in 2...14 {
            if index == 11 {
                secondArray.append("A")
            } else if index == 12 {
                secondArray.append("J")
            } else if index == 13 {
                secondArray.append("K")
            } else if index == 14 {
                secondArray.append("Q")
            } else {
                secondArray.append(String(index))
            }
        }
        
        // rFace 만들기 16개 짜리가 생김 52개짜리를 만들어야 함.
        for item in cardFace {
            for _ in 1...cardFace.count * 13 {
                rFace.append(item)
            }
        }
        
        for item in secondArray {
            for _ in 1...secondArray.count * 4 {
                rSecondArray.append(item)
            }
        }
        
        // 루프 돌면서 secondArray 하니씩 , rface 하나씩
        // array52 만들기
        
        for _ in 1...52 {
            let rNumber1:Int = Int(arc4random_uniform(UInt32(rFace.count)))
            let rNumber2:Int = Int(arc4random_uniform(UInt32(rSecondArray.count)))
            array52.append(rFace[rNumber1] + rSecondArray[rNumber2])
            rFace.remove(at: rNumber1)
            rSecondArray.remove(at: rNumber2)
        }
    }
    
        mutating func makeCard() {
            for outer in 1...7 {
                var tempArray = [String]()
                for _ in 1...outer {
                    let rNumber:Int = Int(arc4random_uniform(UInt32(self.array52.count)))
                    tempArray.append(self.array52[rNumber])
                    self.array52.remove(at: rNumber)
                }
                resultArray.append(tempArray)
            }
            resultArray.append(self.array52)
        }
    
}
