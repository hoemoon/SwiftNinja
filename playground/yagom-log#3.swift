// 2017-02-08

// CH7 : FUNCTION
func 함수이름 ([Parameter Name] [Argument Label]: [Parameter Type]]) -> [return type] {
    code
    return value
}

// 매개변수에 기본값을 지정할 수 있다.
func sayHello(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name)" + " "
    }
    return result
}
// print 함수의 원형
public func print(_ items: Swift.Any..., separator: String = default, terminator: String = default)

// 가변 매개변수, 0개 이상의ㅣ 값을 받아올 수 있고, 인자 값은 배열처럼 사용할 수 있다.
func sayHelloToFriends(friends names: String...) {
    for friends in names {
        print(friends)
    }
}
/* 
    함수의 전달인자로 값을 전달할 때에는 보통 값을 복사해서 전달한다. 
    입출력 매개변수를 사용하면 참조를 전달할 수 있다.
    1. 함수를 홀출할 때, 전달인자의 값을 복사한다.
    2. 해당 전달인자의 값을 변경하면 1에서 복사된 것을 함수 내부에서 변경한다.
    3. 함수를 반환하는 시점에서 2에서 변경된 값을 원래의 매개변수에 할당한다.
    연산자 프로퍼티 또는 감시자를 가지는 프로퍼티가 입출력 매개변수로 전달된다면,
    함수의 호출 시점에 그 접근자, 반환시점에 설정자가 호출된다.
*/
var numbers: [Int] = [1, 2, 3]
func noReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}
func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}
noReferenceParameter(numbers)
print(numbers[1]) // 2
referenceParameter(&numbers)
print(numbers[1]) // 1 바뀐다는 거

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}
var hoemoon: Person = Person()
func reference(_ person: inout Person) {
    person.height = 130
    print(hoemoon.height) // 130
    person = Person() // 새 인스턴스를 할당하면 참조 자체가 변경된다.
}
reference(&hoemoon)

// 반환 값이 없는 함수는 Void라고 적거나 생략하면 된다.
// 함수는 데이터 타입으로 사용될 수 있다.
// (매개변수 타입의 나열) -> 반환 타입
typealias CalcuateTwoInts = (Int, Int) -> Int
func addTwoInts(_ aValue: Int, _ bValue: Int) -> Int {
    return a + b
}
func mathResult(_ mathFunction: CalcuateTwoInts, _ aValue: Int, _ bValue: Int) {
    mathFunction(a, b)
}
print(mathResult(addTwoInts, 3, 5)) // 8
// 특정 조건에 따라 적절한 함수를 반환하는 함수
func chooseMathFunction(_ toAdd: Bool) -> CalcuateTwoInts {
    return toAdd ? addTwoInts : mutiplyTwoInts
}
// 열거형 안에 열거형, 클래스 안에 클래스 가능하다. 함수도 마찬가지.
func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currendPosition: Int) -> Int {
        return currendPosition + 1
    }
    func goLeft(_ currendPosition: Int) -> Int {
        return currendPosition - 1
    }
    return shouldGoLeft ? goLeft : goRight
}
// Noreturning function. 오류를 던진다든가, 중대한 시스템 오류를 보고하고 프로세스를 종료해버린다.
// 비반환 함수는 반환 타입을 Never 라고 명시한다.
func crashAndBurn() -> Never {
    fatalError("Something happend")
}
func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        crashAndBurn()
    }
}

// CH8 : OPTIONAL
// 변수 또는 상수의 값이 nil일 수도 있다는 것을 의미
var myName: String? = "hoemoon"
let primary = School(rawValue: "유치원") // nil 
// 옵셔널은 제네릭이 적용된 열거형으로 구현되어 있다.
// 옵셔널이 값을 갖는 케이스와 그렇지 못한 케이스 두 가지로 정의되어 있다.
// nil 일때는 none, 값이 있는 경우는 some 케이스가 되는데, 연관 값으로 Wrapped가 있다.
// 옵셔널에서 값을 가지면 some의 연관 값이 Wrapped에 값이 할당된다.
public enum Optional<Wrapped> : ExpessibleByNillLiteral {
    case none
    case some(Wrapped)
    public init(_ some: Wrapped)
    // ...
}
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("optional")
    case .some(let value):
        print(value)
    // where 절과 병합해 사용할 수 있다.
    case .some(let value) where value < 0:
        print("nagative value \(value)")
    }
}
// Optional Unwrapping
// 옵셔널에 아닌 변수에는 옵셔널 값이 들어갈 수 없다. 추출해서 할당해야 한다.
// Optional Binding. if let 으로 값을 추출한다.
if let name = myName, let friend = yourName {
    print("We are friend \(name), & \(friend)")
}
// Implicitly Unwapped Optionals
// 암시적 추출 옵셔널로 지정된 타입은 일반 값처럼 사용할 수 있으나,
// 여전히 옵셔널이기 때문에 nil도 할당할 수 있다. 바인딩도 사용할 수 있다.
var myName: String! = "hoemoon"
