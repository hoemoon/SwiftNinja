import Foundation

let n = Int(readLine()!)!
var inputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
inputArray.sort()

var result = 0
for outerIndex in 0..<n {
    let temp = inputArray[outerIndex]
    var count = 0
    for innerIndex in outerIndex + 1..<n {
        if temp == inputArray[innerIndex] {
            count += 1
        }
    }
    if count % 2 == 1 && count != 0 {
        result += 1
    }    
}
print(result)
