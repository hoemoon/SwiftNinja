2017-02-08

연산자는 특정한 문자로 표현한 함수. 따라서 연산자의 역할을 변경할 수도 있다.  
단항, 이항, 삼항, 전위, 중위, 후위  
- `A === B` 참조가 같다
- `A ~= B` A와 B의 패턴이 매치되는지 확인
- `Question ? A : B`
- `A...B`
- `A..<B`

부울 연산자  
- `!B`
- `A && B` AND 논리연산
- `A || B` OR 논리연산

비트 연산자  
복합 할당 연산자  
오버플로 연산자  

- `A ?? B` : A가 nil이 아니면 A를 반환, A가 nil이면 B를 반환.
- `V?` : V값은 안전하게 추출하거나 V가 옵셔널임을 표현한다.
```swift
let valueInt: Int = someOptionalInt != nil ? someOptionalInt! : 0
let valueInt: Int = someOptionalInt ?? 0
```

Precedence, Associativity, Precedence Group  
higerThan, lowerThan, associativity  
infix 중위 연산자, prefix, postfix
```swift
prefix operator **
prefix func ** (value: Int) -> Int {
    return value * value
}
// 전위 연산자 함수 중복 정의
prefix func ! (value: String) -> Bool {
    return value.isEmpty
}
// 하나의 피연산자에 전위와 후위 연산자를 한 줄에 사용하게 되면 후위 연산을 먼저 수행한다.
postfix operator **
postfix func ** (value: Int) -> Int {
    return value + 10
}
// 연산자 우선순위 그룹 지정
precedencegroup 정선순위 그룹 이름 {
    higerThan: 더 낮은 그룹 이름
    lowerThan: 더 높은 그룹 이름
    associativity: 결합 방향(left / right / none)
    assignment: 할당 방향 사용(true / false)
}
// MultiplicationPrecedence라고 명시하지 않으면 DefaultPrecedence 그룹으로 자동 지정
infix operator ** : MultiplicationPrecedence
func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)
}
```
복잡한 연산을 하나의 특수 문자로 구현하는 것

`else` 블록은 없어도 상관없다.  
**switch** 구문  
`break`를 사용한 종료는 선택 사항, `fallthrough` 이용해 case 연속 실행  
`where` 절을 이용해 조건을 확장할 수도 있다.  
비교될 값이 명확히 한정적인 값(열거형 값 등)이 아닐 때는 `default`를 꼭 작성해야 함.  
하나의 case에서 여러 값을 비교할 수 있다.  
case 비교 값에 범위 연산자를 사용할 수 있다.  
와일드카드 식별자 (`_`)  
```swift
typealias NameAge = (name: String, age: Int) 
let tupleValue: NameAge = ("yagom", 99)
// 값 바인딩
switch tupleValue {
case ("yagom", let age):
    print(age)
...
}
```
```swift
for 임시 상수 in 시퀀스 아이템 {
    실행 코드
}
```
함수형 패러다임에 익숙해지면 `for-in` 보다 `map`, `filter`, `flatMap`을 더 많이 사용하게 될 것 임.  

`while` 문에서 `continue`, `break` 같은 제어 키워드 사용할 수 있다.  
`repeat-while` : repeat 블록 코드를 최초 1회 실행한 후, while 블록 코드를 반복한다.  
구문 이름표

