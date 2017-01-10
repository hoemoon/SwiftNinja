func printDiamond3(lines: Int) {
  var fHalf:Float = Float(lines)/2
  fHalf.round()
  let half = Int(fHalf)
  print("lines:", lines, "half:",half)
  
  if (lines % 2 == 0) {
    var array:[Int] = []
    var array2:[Int] = []
    var tempArray:[Int] = []
    var tempArray2:[Int] = []

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
        
        tempArray2.append(array2[cutter-1])
      } else {
        array2.append(cutter)
      }
      tempArray2.reverse()
      
      
    }
    
    array2 += tempArray2
    print(array, array2)
    
  } else {

    for index in 1...lines {
      var result = 2 * index - 1
      if (index > half) {
        result = result - ((index - half) * half)
      }
      print(result, terminator:" ")
    }
    print()
    
    
    let end = half + lines
    for index in half..<end {
      let result = lines - index
      print(abs(result), terminator:" ")
    }
  }
  print()
  print()

}
