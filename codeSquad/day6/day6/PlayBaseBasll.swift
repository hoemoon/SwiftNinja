import Foundation

struct PlayBaseBall {
    var rNumberArray = Array<String>()
    
    mutating func makeRandomNumber() {
        var tempArray = Array<String>()
        for i in 0...9 {
            tempArray.append(String(i))
        }
        for out in 1...3 {
            let end = 10 - out + 1
            let randomUInt32 = arc4random_uniform(UInt32(end))
            rNumberArray.append(tempArray.remove(at: Int(randomUInt32)))
        }
    }

    func userInput() -> Array<String> {
        print("input number")
        var resultArray = Array<String>()
        if let input = readLine() {
            let tempArray = Array(input.characters)
            
            for i in tempArray {
                resultArray.append(String(i))
            }
        }
        return resultArray
    }
    
    func judgeHit(userInputArray:Array<String>) -> (strikeCount: Int, ballCount: Int) {
        var strikeCount:Int = 0
        var ballCount:Int = 0
        
        for i in 0...2 {
            if(rNumberArray[i] == userInputArray[i]) {
                strikeCount += 1
            } else if rNumberArray.contains(userInputArray[i]) {
                ballCount += 1
            }
        }
        
        return (strikeCount, ballCount)
    }
    
    mutating func playGame() -> Bool{
        makeRandomNumber()
        print("랜덤넘버", rNumberArray)

        for _ in 1...9 {
            let tempTuple = judgeHit(userInputArray: userInput())
            if(tempTuple.0 == 3) {
                print("You win.")
                return true
            }
            print("StrikeCount", tempTuple.0, "BallCount", tempTuple.1)
            
        }
        print("You lose.")
        return false
    }
}
 
