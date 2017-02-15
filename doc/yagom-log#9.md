2017-02-12

### CH20 : 프로토콜

특정 역할을 수행하기 위한 메서드, 프로퍼티, 기타 요구사항 등의 청사진  
구조체, 클래스, 열거형은 프로토콜을 Adopted 한다.  
어떤 프로토콜을 요구사항을 따르는 것을 Confrom 한다고 표현한다.

```swift
protocol 프로토콜 이름 {
    프로토콜 정의
}
```

프로토콜은 자신을 채택한 타입이 어떤 *프로퍼티*를 구현해야 하는지 요구할 수 있다.  
일긱 가능한 프로퍼티를 요구해도 실제로 프로토콜을 채택한 클래스에서 구현할 때 읽고 쓰기가 가능한 프로퍼티로 구현해도 된다.

```swift
protocol SomeProtocol {
    var settableProperty: String { get set }
    var notNeedTobeSettableProperty { get }
}
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
    static var anotherProperty: Int { get }
}
// 무언가를 수신할 수 있는 기능
protocol Receiveable {
    func received(data: Any, from: Sendable)
}
// 무언가를 발신할 수 있는 기능
protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }

    func send(data: Any)
    static func isSendableInstance(_ instance: Any) -> Bool
}

class Message: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    var to: Receiveable?
    // 메시지 발신
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            return
        }
        receiver.received(data: data, from: self.from)
    }
    // 메세지 수신
    func received(data: Any, from: Sendable) {
    }
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}
class Mail: Sendable, Receiveable {
    var from: Sendable {
        return self
    }
    var to: Receiveable?
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            return
        }
        receiver.received(data: data, from: self.from)
    }
    func received(data: Any, from: Sendable) {
    }
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}
```

- 함수, 메서드, 이니셜라이저에서 매개변수 타입이나 **반환 타입**으로 사용될 수 있다.
- 프로퍼티, 변수, 상수 등 **타입**으로 사용될 수 있다.
- 배열, 딕셔너리 등 커테이너 요소의 **타입**으로 사용될 수 있다.

Mutating Method Requirements 가변 메서드 요구

```swift
protocol Resttable {
    mutating func reset()
}
class Person: Resttable {
    func reset() { }
}
struct Point: Resttable {
    mutating func reset() { }
}
enum Direction: Resttable {
    case east, west, south, north, unknown
    mutating func reset() { }
}
```

프로토콜에서 가변 메서드를 요구하지 않는다면,  
값 타입의 인스턴스 내부에서는 값을 변경하는 mutating 구현 불가.

### CH21 : 익스텐션

### CH22 : 제네릭

### CH23 : 프로토콜 지향 프로그래밍