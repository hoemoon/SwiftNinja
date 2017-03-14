import Foundation

let inputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
var firstInit = inputArray[0]
let firstVelocity = inputArray[1]
var secondInit = inputArray[2]
let secondVelocity = inputArray[3]
var gap = abs(firstInit - secondInit)

while true {
    firstInit += firstVelocity
    secondInit += secondVelocity
    let tempGap = abs(firstInit - secondInit)
    if tempGap >= gap {
        print("NO")
        break
    }
    gap = tempGap
    if firstInit == secondInit {
        print("YES")
        break
    }
}

