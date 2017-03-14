import Foundation
let nk = readLine()!.components(separatedBy: " ").map { Int($0)! }
var hurdlesArray = readLine()!.components(separatedBy: " ").map { Int($0)! }
hurdlesArray.sort()
if nk[1] > hurdlesArray[hurdlesArray.count - 1] {
    print("0")
} else {
    print(hurdlesArray[hurdlesArray.count - 1] - nk[1])
}
