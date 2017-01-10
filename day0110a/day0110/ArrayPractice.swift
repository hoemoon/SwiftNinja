//
//  ArrayPractice.swift
//  day0110
//
//  Created by hoemoon on 10/01/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

struct ArrayPractice {
    func printArray(array: Array<Array<Int>>) {
        for innerArray in array {
            for item in innerArray {
                print(item, terminator:" ")
            }
            print()
        }
    }
    
    func tempArray(lines: Int) -> Array<Array<Int>> {
        var resultArray = Array<Array<Int>>()
        for _ in 1...lines {
            var tempArray = Array<Int>()
            for xLoop in 1...lines {
                tempArray.append(xLoop)
            }
            resultArray.append(tempArray)
        }
        return resultArray
    }
    
    func fillArray (lines: Int) -> Array<Array<Int>> {
        var resultArray = Array<Array<Int>>()
        var count = 1
        for outIndex in 1...lines {
            var tempArray = Array<Int>()
            let start = outIndex * lines - lines + 1
            for xLoop in start..<start + count {
                tempArray.append(xLoop)
            }
            count = count + 1

            resultArray.append(tempArray)
        }
        return resultArray
    }
}
