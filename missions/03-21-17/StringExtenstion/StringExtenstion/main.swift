//
//  main.swift
//  StringExtenstion
//
//  Created by hoemoon on 21/03/2017.
//  Copyright © 2017 hoemoon. All rights reserved.
//

import Foundation

let targetStr = "http://www.osxdev.org/forum/index.php?threads/swift-2-0에서-try-catch로-fatal-error-잡을-수-있나요.382/"
extension String {
    var hangul: [String] {
        return filterHangulWord(str: self)
    }
    func filterHangulWord(str: String) -> [String] {
        var resultArray = [String]()
        
        func isAlphaNumerics(str: String) -> Bool {
            for v in str.unicodeScalars {
                if CharacterSet.alphanumerics.contains(v) == true {
                    return true
                }
            }
            return false
        }
        
        func isNotNumerics(str: String) -> Bool {
            for v in str.unicodeScalars {
                if CharacterSet.decimalDigits.contains(v) == true {
                    return false
                }
            }
            return true
        }
        
        func isNotAlphabet(str: String) -> Bool {
            let uni = str.unicodeScalars
            let number = uni[uni.startIndex].value
            if number > 96 && number < 122 {
                return false
            }
            return true
        }
        
        let componented = str.components(separatedBy: "-")
        var tempArray1 = [[String]]()
        for item in componented {
            let tempArray = Array(item.characters).map { String($0) }
            tempArray1.append(tempArray.filter { isAlphaNumerics(str: $0) }.filter { isNotAlphabet(str: $0)}.filter { isNotNumerics(str: $0)})
        }
        let result = tempArray1.filter{ $0.count != 0 }
        for item in result {
            resultArray.append(item.joined(separator: ""))
        }
        
        return resultArray
    }
}

print(targetStr.hangul)
// print(String.filterHangulWord(str: targetStr))
