import Foundation

let numberTestCases = Int(readLine()!)!

func growth(cycle: Int) -> Int {
    var result = 1
    if cycle == 0 {
        return result
    }
    for inner in 1...cycle {
        if inner % 2 == 1 { // 홀수
            result *= 2
        } else {
            result += 1
        }
    }
    return result
}
for _ in 1...numberTestCases {
    print(growth(cycle: Int(readLine()!)!))
}
