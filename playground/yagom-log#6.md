2017-02-11

### CH13 : 클로저

함수는 클로저의 한 형태  
변수나 상수가 선언된 위치에서 Reference를 Capture하고 저장할 수 있다.  

```swift
public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
// 통상적인 클로저 표현
{ (매개변수들) -> 반환 타입 in
    실행 코드
}
```
클로저에 입출력 매개변수, 가변 매개변수 사용가능. 매개변수 기본값 사용 불가.

```swift
let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
// Trailling Closure
let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}
// 소괄호 생략
let reversed: [String] = names.sorted { (first: String, second: String)  -> Bool in
    return first > second
}
// 문맥을 통한 타입 유추
let reversed: [String] = names.sorted { (first, second) in 
    return first > second
}
// 단축 인자 이름
let reversed: [String] = names.sorted {
    return $0 > $1
}
// 암시적인 반환 표현
let reversed: [String] = names.sorted { $0 > $1 }
// 연산자 함수 사용. 연산자의 일종의 함수.
let reversed: [String] = names.sorted(by: >)
```

클로저는 자신이 정의된 위치의 주변 문맥을 통해 상수나 변수를 Capture 할 수 있다.  
값 Capture를 통해 상수나 변수가 더는 존재하지 않더라도 그 상수나 변수의 값을 자신 내부에서 참조하거나 수정할 수 있다.  
비동기 작업에 많이 사용된다.

```swift
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
// 자신만의 runningTotal 의 참조를 미리 획득한다.
```

> 함수와 클로저는 참조 타입이다.

특정 상수에 클로저를 할당한다는 것은 값을 할당하는 것이 아니라 해당 클로저의 **참조**를 할당하는 것이다.

함수의 전달인자로 전달된 클로저가 함수 종료 후에 호출될 때 클로저가 함수를 Escape 한다고 표현한다. 클로저를 매개변수로 갖는 함수를 선언할 때 매개변수의 이름의 콜론 뒤에 `@escaping` 키워드를 사용해 클로저의 탈출을 혀용한다는 것을 명시할 수 있다.

`@escaping` 키워드가 없으면 Nonescape Closure. 함수의 동작이 끝난 후 전달된 클로저가 필요 없을 경우 사용한다.

함수의 외부에 정의된 변수나 상수에 저장되어 함수가 종료된 후에 사용될 경우  

```swift
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
```

비탈출 클로저에서는 `self`를 생략하고 인스턴스 프로퍼티를 사용할 수 있다.  
하지만 탈출하는 클로저에서는 `self`를 *사용해야* 값을 획득할 수 있다.

Auto Closure  
호출되었을 때 자신이 감싸고 있는 코드의 결괏값을 반환한다.

```swift
var customersLine: [String] = ["a", "b", "c", "d"]
let customerProvider: () -> String = {
    return customersLine.removeFirst()
}
func serveCustomer(_ customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer( { customersLine.removeFirst() } ) // 암시적 반환. return 생략 가능.
// 자동 클로저
func serveCustomer(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
```

자동 클로저 속성을 부여한 매개변수는 클로저 대신 `코드의 실행 결과`인 String 타입의 문자열을 인자로 받는다.  
String 타입의 값이 자동 클로저 매개변수에 전달되면 String 값을 *매개변수가 없는 String 값을 반환하는 클로저*로 변환해준다.  
기본적으로 `@autoclosure` 속성은 `@noescape` 속성을 포함한다.

### CH14 : 옵셔널 체이닝과 빠른종료

옵셔널 체이닝이 없다면 옵셔널은 귀찮은 존재.

```swift
let hoemoon: Person = Person(name: "hoemoon")
let hoemoonViaOptionalChaning: Int? = hoemoon.address?.building?.room?.number
```

> 서브스크립트는 인덱스를 통해 값을 넣고 빼올 수 있는 기능. Array와 Dictionary에 많이 사용.

Early Exit  

```swift
guard [Bool 타입 값] else {
    [예외사항 실행문문
    [제어문 전환 명령어]
}
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return 
    }
    print("Hello \(name))
    guard let location: String = person["location"] else {
        return 
    }
    print("Location \(location)")
}
```

예외사항만 처리하고 싶다면 `guard` 구문을 쓰는 것이 훨씬 간편하다.  
옵셔널 바인딩 표현에서 옵셔널 값이 있는 상태라면 바인딩 된 상수를 `guard` 구문 아래 코드부터 함수 내부의 지역 상수처럼 사용할 수 있다.

> 쉼표(,)로 추가 조건을 나열할 수 있다.

```swift
guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
    return
}
```

`guard`는 자신을 감싸는 코드 블록, 즉 `return`, `break`, `continue`, `throw` 등의 제어문 전환 명령어를 쓸 수 없는 상황이라면 사용 불가능하다.