import Foundation

let inputFirst = readLine()!.components(separatedBy : " ").map { Int($0)! }
let n = inputFirst[0]
let d = inputFirst[1] % n
var inputSecond = readLine()!.components(separatedBy : " ").map { Int($0)! }

for index in 0..<d {
    let item = inputSecond[index]
    inputSecond.append(item)
}

print(inputSecond.dropFirst(d).map {String(describing : $0)}.joined(separator: " "))
