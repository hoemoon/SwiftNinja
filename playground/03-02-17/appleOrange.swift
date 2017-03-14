import Foundation
var inputArray:[[Int]] = [[Int]]()
var appleCount = 0
var orangeCount = 0
for _ in 1...5 {
    var temp:[Int] = [Int]()
    temp = readLine()!.components(separatedBy: " ").map { Int($0)! }
    inputArray.append(temp)
}
inputArray[0].sort()
let housePosition = inputArray[0]
let appleTreePosition = inputArray[1][0] // 5
let orangeTreePosition = inputArray[1][1] // 15
let applePosition = inputArray[3].map { $0 + appleTreePosition }
let orangePosition = inputArray[4].map { $0 + orangeTreePosition }

for item in applePosition {
    if item >= housePosition[0] && item <= housePosition[1] {
        appleCount += 1
    }
}
for item in orangePosition {
    if item >= housePosition[0] && item <= housePosition[1] {
        orangeCount += 1
    }
}

print(appleCount)
print(orangeCount)
