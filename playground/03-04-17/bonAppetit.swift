import Foundation
let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
var inputArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
inputArray.remove(at: nk[1])
let sum = inputArray.reduce(0, {x, y in x + y}) / 2
let charged = Int(readLine()!)!
if sum == charged {
    print("Bon Appetit")
} else {
    print(abs(sum - charged))
}

