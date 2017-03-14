import Foundation

var inputArray = readLine()!.components(separatedBy: " ").map {Int($0)!}
inputArray.sort()
let addTwo: (Int, Int) -> Int = { x, y in x + y }
var sum = inputArray.reduce(0, addTwo)
print(sum - inputArray[inputArray.count - 1], sum - inputArray[0])
