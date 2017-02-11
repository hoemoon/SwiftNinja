func convertToNumberArray(input: String) -> [Int] {
    var intArray = [Int]()

    for i in input.characters {
        let someString = String(i)
        if let someInt = Int(someString) {
            intArray += [someInt]
        }
    }
    return intArray
}

func checkNumber(input: String) -> Bool {
    let originalNumberArray = convertToNumberArray(input: input)
    var convertalbeNumberArray = convertToNumberArray(input: input)
    convertalbeNumberArray.remove(at: 0)

    let sevenNumber = originalNumberArray[12]
    var numberN = 0

    print(originalNumberArray, convertalbeNumberArray)

    for index in 0...convertalbeNumberArray.count - 1 {
        numberN += originalNumberArray[index] * convertalbeNumberArray[index]
    }
    print(numberN)
    let k = (11 - (numberN % 10)) % 10
    print("k", k)
    if k == sevenNumber {
        return true
    } else {
        return false
    }
}
