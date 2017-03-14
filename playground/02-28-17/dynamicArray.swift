import Foundation

let firstInput = readLine()!.components(separatedBy: " ").map { Int($0)! }
let sequenceN = firstInput[0]
let queryTime = firstInput[1]
var lastAns: Int = 0
var rootArray: [[Int]] = [[Int]]()

for _ in 1...sequenceN {
    var tempArray: [Int] = [Int]()
    rootArray.append(tempArray)
}

for index in 1...queryTime {
    let inputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let xInput = inputArray[1]
    let yInput = inputArray[2]
    if inputArray[0] == 1 {
        let bitwiseModular: Int = (xInput ^ lastAns) % sequenceN
        rootArray[bitwiseModular].append(yInput)
    } else {
        let bitwiseModular: Int = (xInput ^ lastAns) % sequenceN
        lastAns = rootArray[bitwiseModular][yInput % rootArray[bitwiseModular].count]
        print(lastAns)
    }
}

