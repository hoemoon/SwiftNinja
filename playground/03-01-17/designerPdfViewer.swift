import Foundation

let inputHeight: [Int] = readLine()!.components(separatedBy: " ").map { Int($0)! }
let inputAlpha: [String] = Array(readLine()!.characters).map { String($0) }
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
var dict: [String: Int] = [String: Int]()
var height: [Int] = [Int]()

for index in 0..<inputHeight.count {
    dict[alphabet[index]] = inputHeight[index]
}
for item in inputAlpha {
    height.append(dict[item]!)
}
height.sort()
print(height[height.count - 1] * height.count)
