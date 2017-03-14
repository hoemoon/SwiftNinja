import Foundation

var nm = readLine()!
var aInput = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()
var bInput = readLine()!.components(separatedBy: " ").map { Int($0)! }.sorted()

var LCM = 0 // 최소 공배수를 구해야 함
var start = aInput[0]
if aInput[aInput.count - 1] > bInput[0] {
    print(0)
} else {
    while true {
        var innerCount = 0
        for item in aInput {
            if start % item == 0 {
                innerCount += 1
            }
        }
        if innerCount == aInput.count {
            LCM = start
            break
        }
        start += 1
    }
    var maxA = aInput[aInput.count - 1]
    var count = 1
    var candiArray = [Int]()
    var result = [Int]()

    while true {
        let temp = count * LCM
        if temp > bInput[0] {
            break
        }
        candiArray.append(temp)
        count += 1
    }
    for outer in candiArray {
        var mCount = 0
        for inner in bInput {
            if inner % outer == 0 {
                mCount += 1
            }
        }
        if mCount == bInput.count {
            result.append(outer)
            mCount = 0
        }
    }
    print(result.count)
}