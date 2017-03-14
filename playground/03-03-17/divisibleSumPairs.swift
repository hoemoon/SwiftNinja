import Foundation

let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
let inputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
var candiArray = [Int]()
var resultCount = 0

for outer in 0..<inputArray.count {
    for inner in (outer + 1)..<inputArray.count {
        candiArray.append(inputArray[outer] + inputArray[inner])
    }
}
for item in candiArray {
    if item % nk[1] == 0 {
        resultCount += 1
    }
}

print(resultCount)
