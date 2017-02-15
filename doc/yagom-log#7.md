Dracula2017-02-11

### CH15 : 맵, 필터, 리듀스

Map  
자신을 호출할 때 매개변수로 전달된 함수를 실행하여 그 결과를 다시 반환해주는 함수  
`Sequence`, `Collection` 프로토콜을 따르는 타입과 옵셔널은 모두 맵을 사용할 수 있다.

```swift
let multiplyTwo: (Int) -> Int = { $0 * 2 }
let alphabetDictionary: [String: String] = ["a": "A", "b":"B"]
var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) -> String in
    return tuple.0
}
keys = alphabetDictionary.map { $0.0 }
let values: [String] = alphabetDictionary.map { $0.1 }

var numberSet: Set<Int> = [1, 2, 3, 4, 5]
let resultSet = numberSet.map { $0 * 2 }

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map { $0 * 2 }

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map { $0 * 2 }
```

Filter  
컨테이너 내부의 값을 걸러서 추출

```swift
let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
let oddNumbers: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 != 0}
```

Reduce  
Combine 컨테이너 내부의 콘텐츠를 하나로 합쳐주는 고차함수

```swift
var sum: Int = numbers.reduce(0, { (first: Int, second: Int) -> Int in 
    return first + second
})
let sumFromThree: Int = numbers.reduce(3) { 
    return $0 + $1
}
let reduceNames: String = names.reduce("hoemoon's friend :") {
    return $0 + ", " + $1
}
var result: Int = numbers.filter{ $0 % 2 == 0}.map{ $0 * 3 }.reduce(0){ $0 + $1 }

for number in numbers {
    guard number % 2 == 0 else {
        continue
    }
    result += number * 3
}
```

```swift
var result: [Friend] = friends.map { Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }
result = result.filter{ $0.location != "서울" && $0.age >= 25 }
let string: String = result.reduce("서울 외의 지역에 거주하며 25세 이상인 친구") { $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"}
```

### CH16 : 모나드

Monad 특정한 상태로 값을 포장하는 것에서 출발. 옵셔널도 값이 있을지 없을지 모르는 상태 속에 포장하는 것.  
함수 객체와 모나드는 특정 기능이 아닌 디자인 패턴 혹은 자료구조라고 할 수 있다.

옵셔널은 열거형으로 구현되어 있어서 열거형 케이스의 연관 값을 통해 인스턴스 안에 연관 값을 가지는 형태.  
옵셔널이 값을 가지고 있지 않다면 `.none` 케이스, 값을 가지고 있다면 `.some(value)` 케이스로 값을 가지게 된다. 옵셔널의 값을 추출한다는 것은 열거형 인스턴스 내부의 `.some(value)` 케이스의 **연관 값**을 꺼내오는 것과 같다.

'컨텍스트는 2라는 값을 가지고 있다.' - 2라는 숫자롤 옵셔널로 둘러싼 상태   
'컨텍스트는 존재하지만 내부에 값이 없다.' - 값이 없는 옵셔널 상태  
순수한 값이 아닌 무언가로 둘러싸인 컨텍스트가 전달된다.

옵셔널은 컨테이너와 값을 가지기 때문에 맵 함수를 사용할 수 있다.  
'함수 객체란 맵을 적용할 수 있는 컨테이너 타입'  
Array, Dictionary, Set 등등의 컬렉션 타입이 함수 객체  

1. 맵이 함수를 인자로 받는다.
2. 함수 객체에 맵이 전달 받은 함수를 적용
3. 새로운 함수 객체를 반환

```swift
// 옵셔널 map 메서드 구현 
extention Optional {
    func map<U>(f: (Wrapped) -> U) -> U? {
        switch self {
        case .some(let x): return f(x)
        case .none: return .none    
        }
    }
}
```

1. 컨텍스트로부터 값 추출
2. 전달받은 함수 적용
3. 결괏값을 다시 컨텍스트에 담아 반환 

Monad  
함수 객체의 일종  
컨텍스트에 포장된 값을 처리하여 컨텍스트에 포장된 값을 다시 반환하는 함수 적용 가능.  
**플랫맵** 메서드  
포장된 값을 받아서 값이 있으면 포장을 풀어서 값을 처리한 후 포장된 값을 반환하고,  
값이 없으면 값이 없는 대로 다시 포장하여 반환.  
옵셔널은 모나드이므로 플랫맵을 사용할 수 있다.

1. 컨텍스트로부터 값 추출
2. 추출한 값을 doubleEven 함수에 전달 
3. 빈 컨텍스트 반환 

플랫맵과 맵의 차이점은 내부의 값을 알아서 더 추출해준다는 것이다.

```swift
let optionalArr: [Int?] = [1, 2, nil, 5]
let mappedArr: [Int?] = optionalArr.map{ $0 } // [Optional(1), Optional(2), nil, Optional(5)]
let flatmappedArr: [Int] = optionalArr.flatMap{ $0 } // [1, 2, 5]
```

플랫맵을 통해 클로저를 실행하면 알아서 내부 컨테이너까지 값을 추출한다.

```swift
// 중첩된 컨테이너 
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]
let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
// [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0 } }
// [1, 2, 3, 4, 5]
```

플랫맵은 내부의 값을 1차원으로 펼쳐놓는 작업도 수행.  
값을 꺼내어 모두 동일한 위상으로 펼쳐놓는 모양새를 갖출 수 있다.

플랫맵을 사용하여 체인을 연결하였을 때 결과는 옵셔널 타입이다.  
맵을 사용하여 체인을 연결하면 옵셔널의 옵셔널 형태가 반환된다.  
플랫맵은 함수의 결괏값이 값이 있다면 추출해서 평평하게 만드는 과정을 내포하고,  
맵은 옵셔널 타입의 값을 옵셔널이라는 컨터에니 안에 다시 집어넣어 반환.

```swift
// 옵셔널의 맵과 플랫맵의 정의
public func map<U>(_ transform: (Wrapped) throws -> U) rethrows -> U?
public fuc flatMap<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U?

// 옵셔널 바인딩을 통한 연산
if let str: String = optionalString {
    if let num: Int = stringToInt(str: str) {
        if let finalStr: String = intToString(integer: num) {
            if let finalNum: Int = stringToInt(str: finalStr) {
                result = Optional(finalNum)
            }
        }
    }
}
if let str: String = optionalString, let num: Int = stringToInt(str: str), let finalStr: String = intToString(integer: num), let finalNum: Int = stringToInt(str: finalStr) {
    result = Optional(finalNum)
}
```

플랫맵은 체이닝 중간에 연산에 실패하는 경우나 값이 없어지는 경우는 별도의 예외처리 없이 빈 컨테이너를 반환한다.





