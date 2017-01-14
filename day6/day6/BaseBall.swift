//
//  BaseBall.swift
//  day6
//
//  Created by hoemoon on 12/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct BaseBallGame {
    var inputNumber: Int = 0
    var randomArray = Array<Int>()
    var inputArray = Array<Int>()
    
    mutating func newGame() {
        for _ in 1...3 {
            randomArray.append(Int(arc4random_uniform(9) + 1))
        }
    }
    
    mutating func readNumber() {
        print("0이 아닌 세 자리 숫자를 입력하세요. 예) 123")
        if let inputNumber = readLine() {
            print("\(inputNumber) 를 입력했습니다.")
            let tempString = String(inputNumber)!
            let tempArray = Array(tempString.characters)
            for i in tempArray {
                let j = String(i)
                inputArray.append(Int(j)!)
            }
        } else {
            print("Why are you being so coy?")
        }
    }
    
    func hit(input:Array<Int>) -> (strikeCount:Int, ballCount:Int) {
        var strikeCount:Int = 0
        var ballCount:Int = 0
        
        for i in 0...2 {
            if(randomArray[i] == inputArray[i]) {
                strikeCount += 1
            } else if randomArray.contains(inputArray[i]) {
                ballCount += 1
            }
        }
        
        return (strikeCount, ballCount)
    }
    
    mutating func showGameScore() -> Bool {
        
        for i in 1...9 {
            self.readNumber()
            self.hit(input: inputArray)
        }
        
        return true
    }
    func printNumber() {
        print(randomArray)
//        print(inputNumber)
        print(inputArray)
    }
}
