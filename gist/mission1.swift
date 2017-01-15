// 1
func printXY(max: Int) {
  for _ in 1...max {
    for index in 1...max {
      print(index, terminator: "")
    }
    print()
  }
}

// 2
func printTree1(num: Int) {
  for index in 1...num {
    for _ in 1...index {
      print("⭐️", terminator:"")
    }
    print()
  }
}

// 3
func printTree2 (num: Int) {
  print("")
  for index in 1...num {
    let candy = num - index
    
    if(candy != 0) {
      for _ in 1...candy {
        print("  ", terminator:"")
      }
    }
    
    for _ in 1...index {
      print("⭐️", terminator:"")
    }
    print("")
  }
}

// 4
func printNumbers (lines: Int) {
  print("\n")
  var i = 1
  
  for index in 1...lines {
    for _ in 1...index {
      print("\(i)", terminator:" ")
      i += 1
    }
    print("")
  }
}

// 5
func printSquare(columns: Int) {
  print("\n")
  for index in 1...25 {
    print("\(index) ", terminator:"")
    if (index % columns == 0) {
      print("")
    }
  }
}

// 6
func printReverse (number: Int) {
  // 5개 단위로 잘라서 배열 넣기
  var outArray: Array<Array<Int>> = []
  var temp:Array<Int> = []
  var toggle: Bool = true

  for index in 1...25 {
    temp.append(index)
    
    if (index % number == 0) {

      outArray.append(temp)
      temp.removeAll()
    }
  }
  // 토글 스위치 즉, 짝수 번째 배열은 뒤집어서 프린트, 나머지는 정상 프린트
  for element in outArray {
    if (toggle == true) {
      for innerElement in element {
        print(innerElement, terminator:" ")
        toggle = false
      }
    } else {
      for innerElement in element.reversed() {
        print(innerElement, terminator:" ")
        toggle = true
      }
    }
    
    print("")
  }
}

// 7
func fizzbuzz(lines: Int) -> Array<String> {
  var resultArray: Array<String> = Array()
  
  for index in 1...lines {
    if (index % 3 == 0 && index % 5 == 0) {
      resultArray.append("FizzBuzz")
      continue
    }
    if(index % 3 == 0) {
      resultArray.append("Fizz")
      continue
    }
    
    if(index % 5 == 0) {
      resultArray.append("Buzz")
      continue
    }
    resultArray.append(String(index)) 
  }  
  return resultArray
}

print(fizzbuzz(lines: 15))

// 8

func makeDiamondArray(lines: Int) -> Array<Array<Int>> {
  var resultArray:Array<Array<Int>> = []
  var fHalf:Float = Float(lines)/2
  fHalf.round()
  let half = Int(fHalf)
  var array:[Int] = []
  var array2:[Int] = []
  var tempArray:[Int] = []
  var tempArray2:[Int] = []
  
  if (lines % 2 == 0) {
    for index in 1...lines {
      var result = 2 * index - 1
      if (index > half) {
        result = array[index - half - 1]
        tempArray.append(result)
        
      } else {
        array.append(result)
      }
    }
    tempArray.reverse()
    array += tempArray
    
    for index in 1...lines {
      
      let cutter = abs(index - half)
      if(index > half) {
        tempArray2.append(abs(cutter-3))

      } else {
        array2.append(cutter)
      }
      
    }
    tempArray2.reverse()

    array2 += tempArray2
    
    
  } else {

    for index in 1...lines {
      var result = 2 * index - 1
      if (index > half) {
        result = result - ((index - half) * half)
      }
       array.append(result)
    }
    
    let end = half + lines
    for index in half..<end {
      let result = lines - index
      array2.append(abs(result))
    }
  }

  resultArray.append(array)
  resultArray.append(array2)
  return resultArray
}

func printDiamond(lines: Int) {
  let void = makeDiamondArray(lines: lines)[1]
  let star = makeDiamondArray(lines: lines)[0]
  
  for index in 0...void.count - 1 {

    for i in 0...void[index] {
      if (i != 0) {
        print(" ", terminator: "")
      }
      
    }
    
    for i in 0...star[index] {
      if (i != 0) {
        print("*", terminator: "")
      }

    }
    print()
  }
  print()
  
}

printDiamond(lines: 6)
printDiamond(lines: 7)


// 9 
func factorial(n: Int) -> Int {
  var result = 1
  if(n == 1) {
    return result
  }
  for index in 2...n {
    result *= index
  }
  return result
}

