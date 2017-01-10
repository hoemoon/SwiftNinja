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
    
    func makeMagicSquare(row: Int) -> Array<Array<Int>> {
        var resultArray = Array<Array<Int>>()
        let end = row * row
        
        for _ in 1...row {
            let tempArray = Array<Int>(repeating: 0, count: row)
            resultArray.append(tempArray)
        }
        resultArray[row - 1][row - 1 - (row - 1)/2] = 1
        
        
        // 재귀 함수
        // 좌표를 받고 다음 좌표를 반환해야 함
        // 매개변수로 2,1
        // 단순히 다음 좌표를 알려주는 함수임
        func fillCoordinate(first:Int, second:Int, number: Int) -> (Int, Int) {
            var cFirst = first + 1
            var cSecond = second - 1
            
            if cFirst > row - 1 && cSecond < 0{
                cFirst = cFirst - 2
                cSecond = cSecond + 1
                resultArray[cFirst][cSecond] = number
            } else if cFirst > row - 1 {
                cFirst = cFirst - row
                resultArray[cFirst][cSecond] = number
            } else if cFirst < 0 {
                cFirst = cFirst + row
                resultArray[cFirst][cSecond] = number
            } else if cSecond > row - 1 {
                cSecond = cSecond - row
                resultArray[cFirst][cSecond] = number
            } else if cSecond < 0 {
                cSecond = cSecond + row
                resultArray[cFirst][cSecond] = number
            } else if resultArray[cFirst][cSecond] != 0{
                cFirst = cFirst - 2
                cSecond = cSecond + 1
                resultArray[cFirst][cSecond] = number
            } else {
                resultArray[cFirst][cSecond] = number
            }
            
            return (cFirst, cSecond)
        }
        // resultArray 갱신도 해야 함
        var tuple = (row - 1, row - 1 - (row - 1)/2)
        
        for index in 2...end {
            tuple = fillCoordinate(first: tuple.0, second: tuple.1, number: index)
        }
        
        return resultArray
    }
}
