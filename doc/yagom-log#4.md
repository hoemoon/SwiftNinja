2017-02-10

### CH9 : 구조체와 클래스

구조체의 경우... 자동으로 생성되는 멤버와이즈 이니셜라이저, 사용자 정의 이니셜라이저
구조체와 다르게 클래스의 인스턴스는 참조 타입이므로 클래스의 *인스턴스 상수*를 le저으로 선언해도 내부 프로퍼티 값을 변경할 수 있다.  
Deinitializer deinit 인스턴스가 소멸되기 직전에 호출된다. 클래스 당 하나만 구현할 수 있다.

- 구조체는 상속할 수 없다.  
- 타입 캐스팅은 클래스의 인스턴스에만 허용된다.  
- Deinitializer는 클래스의 인스턴스에만 활용할 수 있다.  
- Reference Counting은 클래스의 인스턴스에만 적용된다.  

스위프트의 기본 데이터 타입은 모두 구조체  
전달인자를 통해 데이터를 전달하면 모두 값이 복사되어 전달될 뿐, 값을 변경해도 기존의 변수나 상수는 변하지 않는다.  

### CH10 : 프로퍼티와 메서드

프로퍼티는 클래스, 구조체 또는 열거형 등에 관련된 값.  
메서드는 특정 타입에 관련된 함수  

- Stored Properties : 인스턴스의 변수 또는 상수를 의미
- Computed Properties  : 값은 저장한 것이 아니라 특정 연산을 수행한 결괏값을 의미, 열거형에도 사용.
- Type Properties : 특정 타입에 사용되는 프로퍼티

> Property Observers는 프로퍼티 값의 변화에 따른 특정 액션을 수행한다. 저장 프로퍼티에 적용할 수 있으며 부모로부터 상속가능하다.  

클래스의 저장 프로퍼티는 옵셔널이 아니라면 프로퍼티 기본값을 지정해주거나 사용자 정의 이니셜라이저를 통해 *반드시* 초기화해주어야 한다.  
당연히 초기값을 지정해놓으면 이니셜라이저를 구현할 필요 없다.
구조체의 경우 프로퍼티에 맞는 이니셜라이저를 자동으로 제공한다.

Lazy Stored Properties  
`lazy` 키워드를 사용한다. 호출이 있어야 값을 초기화 한다. 불필요한 성능저하나 공간 낭비를 줄일 수 있다.

```swift
class Position {
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String

    init(name: String) {
        self.name = name
    }
}
let hoemoonPosition: Position = Position(name: "hoemoon")

// point 프로퍼티로 처음 접근할 때 point: CoordinatePoint가 생성된다.
print(hoemoonPosition.point)
```

연산 프로퍼티 Computed Properties  
인스턴스 내/외부의 값을 연산하여 적절한 값을 돌려주는 getter의 역할이나 은닉화 내부의 프로퍼티 값을 간접적으로 설정하는 setter의 역할을 수행할 수도 있다. 클래스, 구조체, 열거형에 정의할 수 있다. 메서드보다 직관적이다. 

```swift 
// 메서드를 이용한 구현
struct CoordinatePoint {
    var x: Int
    avr y: Int

    func oppositePoint() -> CoordinatePoint {
        return CoordinatePoint(x: -x, y: -y)
    }
    mutating func setOppoistePoint(_ opposite: CoordinatePoint) {
        x = -opposite.x
        y = -opposite.y
    }
}
// 연산 프로퍼티를 이용한 구현
struct CoordinatePoint {
    // 생략
    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}
// 매개변수 이름 생략한 setter, newValue로 매개변수 이름을 대신할 수 있다.
struct CoordinatePoint {
    // 생략
    var oppositePoint: CoordinatePoint {
        get {
            return CoordinatePoint(x: -x, y: -y)
        }
        set {
            x = -newValue.x
            y = -newValue.y
        }
    }
}
```

프로퍼티 감시자 Property Observers  
프로퍼티의 값이 새로 할당될 때마다 호출되는데 변경되는 값이 현재의 값과 같더라도 호출된다.  
프로퍼티 재정의를 통해 상속된 저장 프로퍼티 또는 연산 프로퍼티에도 적용 가능하다.  

프로퍼티의 값이 *변경되기 직전*에 호출되는 `willSet`메서드와 프로퍼티 값이 *변경된 직후*에 호출되는 `didSet` 메서드가 있다. 각각 매개변수가 하나씩 존재한다.  
`willSet` 메서드에 전달되는 전달인자는 프로퍼티가 **변경될 값**이고, `didSet` 메서드에 전달되는 전달인자는 프로퍼티 **변경되기 전의 값**이다.  
매개변수의 이름을 따로 지정하지 않으면 `newValue`, `oldValue`가 매개변수의 이름으로 자동 지정된다.

```swift
class Account {
    var credit: Int = 0 {
        willSet {
            print("\(credit)이 \(newValue)으로 변경될 예정이다.")
        }
        didSet {
            print("\(oldValue)이 \(credit)으로 변경되었다.")
        }
    }
}
// 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
class Account {
    var credit: Int = 0 { // 저장 프로퍼티
        willSet {
        }
        didSet {
        }
    }
    var dollarValue: Double { // 연산 프로퍼티
        get {
            return Double(credit)
        }
        set {
            credit = Int(newValue * 1000)
        }
    }
}
class ForeignAccount: Account {
    override var dollarValue: Double {
        willSet {
        }
        didSet {
        }
    }
}
```

전역변수 또는 전역상수는 지연 저장 프로퍼티처럼 처음 접근할 때 최초로 연산이 이루어진다.  
지역변수 및 지역상수는 절대로 지연 연산 되지 않는다.  

각각의 인스턴스가 아닌 타입 자체에 속하게 되는 프로퍼티를 Type Property  
타입 프로퍼티는 두 가지.  
저장 프로퍼티는 변수 또는 상수로 선언 가능. 연산 프로퍼티는 변수로만 선언 가능.  
저장 프로퍼티는 **반드시** 초깃값을 설정해야 하며 *지연 연산* 된다.
지연 저장 프로퍼티와는 다르게 다중 스레드 환경이라도 단 한 번만 초기화된다는 보장을 받는다.

인스턴스 생성 여부와 상관없이 타입 프로퍼티의 값은 하나이다.

```swift
class Aclass {
    static var typeProperty: Int = 0 // 저장 타입 프로퍼티
    static let dollarExchangeRate: Double = 1000.0 // 타입 상수
    var credit: Int = 0 // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 { // 저장 인스턴스 프로퍼수
        didSet {
            Aclass.typeProperty = instanceProperty + 100
        }
    }
    static var typeComputedProperty: Int { // 연산 타입 프로퍼티
        get {
            return typeProperty
        }
        set {
            typeProperty = newValue
        }
    }
    var dollarValue: Double { // 연산 인스턴스 프로퍼티
        get {
            return Double(credit)
        } 
        set {
            // 인스턴스에 접근할 필요없이 타입 이름만으로도 사용 가능하다.
            credit = Int(newValue * Aclass.dollarExchangeRate)
        }
    }
}
```

클래스, 구조체, 열거형 등은 각각의 인스턴스가 특정 작업을 수행하는 기능을 캡슐화하기 위해 인스턴스 메서드를 정의할 수 있다.  
또, 타입 자체와 관련된 기능을 수행하기 위한 타입 메서드를 정의할 수도 있다.

자신의 프로퍼티 값을 수정할 때 클래스의 인스턴스 메서드를 제외하고, 구조체나 열거형 등은 값 타입이므로 메서드 앞에 `mutating` 키워드를 붙여야 한다.

모든 인스턴스는 암시적으로 생성된 `self` 프로퍼티를 갖는다. 인스턴스 자기 자신을 가리키는 프로퍼티이다.  
self 프로퍼티를 이용해 *값 타입*(구조체, 열거형)의 인스턴스 자체의 값을 치환할 수 있다.
즉, class의 경우 불가능하다.

```swift
struct LevelStruct {
    var level: Int = 0
    mutating func reset() {
        self = LevelStruct()
    }
}
enum OnOffSwitch {
   case on, off
   mutating func nextState() {
       self = self == .on ? .off : .on
   } 
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState() // toggle -> on
```

타입 메서드  
`static`, `class` 키워드를 사용할 수 있는데, `static`으로 정의하면 상속 후 메서드 재정의가 불가능하고, `class`로 정의하면 상속 후 메서드 재정의가 가능하다.

```swift
class AClass {
    static func staticTypeMethod() {
    }
    class func classTypeMethod() {
    }
}

class BClass {
    override static func staticTypeMethod() {
        // 재정의 불가
    }
    override class func classTypeMethod() {
    }
}
```

인스턴스 메서드와 달리 타입 메서드에서는 `self` 프로퍼티가 타입 그 자체를 가리킨다.

```swift
struct SystemVolume {
    static var volume: Int = 5 // 타입 프로퍼티로 가지게 되면 언제나 유일한 값이 된다.
    static func mute() { // 타입 프로퍼티를 제어하는 타입 메서드
        self.volume = 0 // SystemVolume.volume = 0 과 동일한 표현
    }
}
class Navigation {
    var volume: Int = 5 // 네비게이션 인스턴스마다 음량을 따로 설정 가능
    func guideWay() {
        SystemVolume.mute() // 네비게이션 외 다른 재생원 음소거 
    }
    func finishGuideWay() {
        SystemVolume.volume = self.volume // 길 안내 종료 후 기존 재생원 음성 복구
    }
}
```
