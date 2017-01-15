// 배열 연습 #1 fillArray()
func fillArray (lines: Int) -> Array<Array<Int>> {
    var resultArray = Array<Array<Int>>()
    for outIndex in 1...lines {
        var tempArray = Array<Int>()
        let start = outIndex * lines - lines + 1
        for xLoop in start..<start + outIndex {
            tempArray.append(xLoop)
        }
        resultArray.append(tempArray)
    }
    return resultArray
}

// 배열 연습 #2 setBoolArray() printArray()
func setBoolArray (lines: Int) -> Array<Array<Bool>> {
    var resultArray = Array<Array<Bool>>()
    
    for outIndex in 0...lines - 1 {
        var tempArray = Array<Bool>()
        for index in 0...abs(outIndex - lines) - 1 {
            
            if (index == 0){
                continue
            }
            tempArray.append(false)
        }
        
        for _ in 0...outIndex {
            tempArray.append(true)
        }
        resultArray.append(tempArray)
    }
    return resultArray
}

// 배열 연습 #3 makeMaginSquare(row:Int) -> Array<Array<Int>>
func makeMagicSquare(row: Int) -> Array<Array<Int>> {
    var resultArray = Array<Array<Int>>()
    let end = row * row
    
    for _ in 1...row {
        let tempArray = Array<Int>(repeating: 0, count: row)
        resultArray.append(tempArray)
    }
    resultArray[row - 1][row - 1 - (row - 1)/2] = 1
    
    func fillCoordinate(first:Int, second:Int, number: Int) -> (Int, Int) {
        var cFirst = first + 1
        var cSecond = second - 1
        
        if cFirst > row - 1 && cSecond < 0{
            cFirst = cFirst - 2
            cSecond = cSecond + 1
            resultArray[cFirst][cSecond] = number
        } else if cFirst > row - 1 {
            cFirst = cFirst - row
            resultArray[cFirst][cSecond] = number
        } else if cFirst < 0 {
            cFirst = cFirst + row
            resultArray[cFirst][cSecond] = number
        } else if cSecond > row - 1 {
            cSecond = cSecond - row
            resultArray[cFirst][cSecond] = number
        } else if cSecond < 0 {
            cSecond = cSecond + row
            resultArray[cFirst][cSecond] = number
        } else if resultArray[cFirst][cSecond] != 0{
            cFirst = cFirst - 2
            cSecond = cSecond + 1
            resultArray[cFirst][cSecond] = number
        } else {
            resultArray[cFirst][cSecond] = number
        }
        
        return (cFirst, cSecond)
    }
    var tuple = (row - 1, row - 1 - (row - 1)/2)
    
    for index in 2...end {
        tuple = fillCoordinate(first: tuple.0, second: tuple.1, number: index)
    }
    
    return resultArray
}

// 개미 수열
func makeAntSequence(inputArray:Array<Int>) -> Array<Int> {
    var resultArray = Array<Int>()
    if( inputArray.count == 1) {
        return [1, 1]
    }
    
    let end = inputArray.count - 2
    var count = 1
    
    for outIndex in 0...end {
        let temp = inputArray[outIndex]
        for index in outIndex...outIndex {
            if(temp == inputArray[index + 1]) {
                count += 1
                
                if (index == end) {
                    resultArray.append(temp)
                    resultArray.append(count)
                }
                
            } else {
                resultArray.append(temp)
                resultArray.append(count)
                count = 1
                
                if (index == end) {
                    resultArray.append(inputArray[index + 1])
                    resultArray.append(count)
                }
            }
        }
    }
    return resultArray
}

// 야구 게임
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
