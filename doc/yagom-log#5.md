2017-02-11

### CH5 : 인스턴스 생성 및 소멸

init 메서드는 클래스, 구조체, 열거형 등의 구현부 또는 그 타입의 익스텐션 구현부에 위치한다.

```swift
class SomeClass {
    init() {
    }
}
struct SomeStruct {
    init() {
    }
}
enum SomeEnum {
    init() {
        // 열거형은 초기화 시 반드시 케이스 중 하나가 되어야 한다.
        self = .someCase
    }
}
```

이니셜라이저를 통해 초깃값을 할당하거나, 프로퍼티 기본값을 통해 처음 저장 프로퍼티가 초기화될 때에는 프로퍼티 감시자 메서드가 호출되지 않는다.

```swift
struct Area {
    var squareMeter: Double
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    int(value: Double) {
        squareMeter = value
    }
    init(_ value: Double) {
        squareMeter = value
    }
}
let roomOne: Area = Area(fromPy: 15.0)
let roomTwo: Area = Area(fromSquareMeter: 33.6)
let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)
```

인스턴스가 사용되는 동안에 값을 꼭 가지지 않아도 되는 또는 초기화되는 과정에서 값을 지정해주기 어려운 경우 저장 프로퍼티는 *옵셔널*로 선언할 수 있다.  
*상수*로 선언된 프로퍼티는 인스턴스를 초기화하는 과정에서만 값이 할당될 수 있다. 이후 변경할 수 없다.  
기본 이니셜라이저는 저장 프로퍼티의 기본값이 모두 지정되어 있고, 동시에 사용자 정의 이니셜라이저가 정의되지 않은 상태에서 제공된다.  

```swift
// 초기화 위임
enum Student {
    case elementary, middle, high
    case none
    init() {
        self = .none
    }
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}
```

Failable initializer : 클래스, 구조체, 열거형 등 모두에 적용할 수 있다.  
실패했을 때 `nil`을 반환하므로 반환 타입이 옵셔널로 지정된다.

```swift 
// 실패 가능한 이니셜라이저
class Person {
    let name: String
    var age: Int?
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
    }
}
```

실패 가능한 이니셜라이저는 구조체와 클래스에도 유용하지만 특히 *열거형*에서 유용하게 사용될 수 있다. `rawValue`를 통한 초기화

클로저나 함수를 통해 프로퍼티에 기본값을 제공할 수 있다.  
클로저가 실행되는 시점은 이니셜라이즈될 때 인스턴스의 다른 프로퍼티의 값이 세팅되기 전이다. 즉, 클로저 내부에서는 인스턴스의 다른 프로퍼티를 사용하여 연산할 수 없다. `self`를 사용할 수도 없다.

```swift
// 클로저를 이용한 기본값 세팅
struct Student {
    var name: String?
    var number: Int?
}
class SchoolClass {
    var students: [Student] = {
        var arr: [Student] = [Student]()
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }() // 소괄호가 붙는 이유는 클로저를 실행하기 위해서 임. 
        // 소괄호가 없으면 프로퍼티 기본값은 클로저 그 자체가 된다.
}
```

Deinitializer  
메모리에서 해제되기 직전 클래스 인스턴스와 관련하여 원하는 정리 작업을 구현할 수 있다.  
**클래스 인스턴스에만 구현할 수 있다.**

### CH12 : 접근제어
은닉화 Access Control  
Module 배포할 코드의 묶음 단위

`open`, `public`, `Internal`, `fileprivate`, `private`  
*Public* 수준은 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 쓰인다.  
*Open* 수준. 클래스와 클래스 멤버에서만 사용 가능.  
*Open* 수준의 클래스는 그 클래스가 정의된 **모듈 밖**의 다른 모듈에서도 *상속*될 수 있다.  
*Open* 수준의 클래스 멤버는 그 멤버가 정의된 **모듈 밖**의 다른 모듈에서도 *재정의* 될 수 있다. 
이외의 접근수준의 클래스, 클래스 멤버는 정의된 **모듈 안**에서만 상속, 재정의 가능하다.

```swift
open class NSString: NSObject, NSCopying, NSMutableCopying, NSSecureCoding {
    open var length: Int { get }
    open func character(at index: Int) -> unichar
    public init()
    public init?(coder: aDecoder: NSCoder)
}
```

`internal` 수준은 기본적으로 모든 요소에 암묵적으로 지정되는 접근 수준  
구현된 소스파일이 속해있는 모듈 어디서든 쓰일 수 있다.  
그 모듈을 가져다 쓰는 외부 모듈에서는 접근할 수 없다.  
모듈 내부에서 광역적으로 사용될 경우 사용.

`fileprivate` 그 요소가 구현된 소스파일 내부에서만 사용 가능  
소스파일 외부에서 값이 변경되거나 함수가 호출되면 부작용이 생길 경우 사용.

`private` 같은 소스파일 안에 구현된 다른 타입이나 기능에서도 사용할 수 없다.

> 상위 요소보다 하위 요소가 더 높은 접근 수준을 가질 수 없다.