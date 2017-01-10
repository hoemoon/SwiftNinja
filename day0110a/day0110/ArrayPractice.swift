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
    
    func printArray(array: Array<Array<Bool>>, newChar:Character) {
        for innerArray in array {
            for item in innerArray {
                if(item == true) {
                    print(newChar, terminator: "")
                }
                if(item == false) {
                    print(" ", terminator:"")
                }
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
        for outIndex in 1...lines {
            var tempArray = Array<Int>()
            let start = outIndex * lines - lines + 1
            for xLoop in start..<start + outIndex {
                tempArray.append(xLoop)
            }
            resultArray.append(tempArray)
        }
        return resultArray
    }
    
    func setBoolArray (lines: Int) -> Array<Array<Bool>> {
        var resultArray = Array<Array<Bool>>()
        
        for outIndex in 0...lines - 1 {
            var tempArray = Array<Bool>()
            for index in 0...abs(outIndex - lines) - 1 {
                
                if (index == 0){
                    continue
                }
                tempArray.append(false)
            }
            
            for _ in 0...outIndex {
                tempArray.append(true)
            }
            resultArray.append(tempArray)
        }
        return resultArray
    }
    
//    func makeMagicSquare(row: Int) -> Array<Array<Int>>.Element {
//        <#function body#>
//    }
}
