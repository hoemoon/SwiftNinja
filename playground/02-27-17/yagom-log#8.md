2017-02-12

### CH17 : 서브스크립트

클래스, 구조체, 열거형에는  
컬렉션, 리스트, 시퀀스 등의 타입의 요소에 접근하는 단축 문법인 Subscript를 정의할 수 있다.  
별도의 Getter나 Setter를 구현하지 않아도 인덱스를 통해 값을 설정하거나 가져올 수 있다.  
여러 개의 서브스크립트를 overload 중복 정의 할 수 있다.

`subscript` 키워드를 사용해 정의한다.  

```swift
// 당연히 설정자의 암시적 전달인자인 newValue를 사용할 수 있다.
subscript(index: Int) -> Int {
    get {}
    set(newValue) {}
}
// get, set 키워드를 사용하지 않고도 구현할 수 있다.
subscript(index: Int) -> Int {
    // 적절한 서브스크립트 결괏값 반환
}
```

### CH18 : 상속

자식 클래스는 부모로부터 인스턴스 메서드, 타입 메서드, 인스턴스 프로퍼티, 타입 프로퍼티, 서브스크립트 등을 상속받는다.

메서드의 `반환 타입`이나 `매개변수`가 다르면 서로 다른 메서드로 취급된다.

프로퍼티를 재정의한다는 것은 프로퍼티 자체가 아니라 프로퍼티의 Getter, Setter, Property Observer 등의 재정의하는 것을 말한다.  
조상 클래스에서 저장 프로퍼티로 정의된 프로퍼티는 물론 연산 프로퍼티로 정의된 프로퍼티도 재정의 가능하다.  
프로퍼티를 상속받은 자식클래스에서는 조상 클래스의 프로퍼티 종류를 알 수 없다. 단지 이름과 타입만을 알고 있다.  
재정의하려는 프로퍼티는 조상 클래스 프로퍼티와 이름과 타입이 일치해야 한다.

조상에서 읽기 전용 -> 자식 클래스에서 읽고 쓰기 가능한 프로퍼티로 가능하다.  
읽고 쓰기 가능했던 프로퍼티 -> 읽기 전용 (불가)

일고 쓰기가 모두 가능한 프로퍼티를 재정의할 때, Setter만 따로 재정의할 수 없다.  
따로 변경이 필요 없다면, `super`, `someProperty` 같은 식으로 부모 클래스의 접근자를 사용하여 값을 받아서 반환해야 한다.

Property Observer도 재정의할 수 있다. 조상 클래스에 정의된 프로퍼티가 연산 프로퍼티인지 저장 프로퍼티인지는 상관없다.  
상수 저장 프로퍼티나 읽기 전용 연산 프로퍼티는 Property Observer를 재정의할 수 없다.  
물론, Property Observer를 재정의하더라도 조상클래스에 정의된 Property Observer는 동작한다.  
프로퍼티의 Setter와 Property Observer를 동시에 정의할 수 없다.

서브스크립트도 재정의할 수 있다.  
재정의하려는 서브스크립트는 부모 클래스의 서브스크립트와 *매개변수*와 *반환타입*이 같아야 한다.

특성 앞에 `final`을 붙이면 재정의를 방지할 수 있다.  
클래스 앞에 쓰면 해당 클래스는 더 이상 자식 클래스를 가질 수 없다.

#### 클래스의 이니셜라이저

클래스에서는 *Designated Initializer*와 *Convenience Initializer*로 구분한다.  
Designated Initializer  
필요에 따라 부모클래스의 이니셜라이저를 호출할 수 있다.  
정의된 클래스의 모든 프로퍼티를 초기화해야 한다.  
클래스의 이니셜라이저 중 기둥 같은 역할을 한다. 하나 이상 정의된다.  
여러 개를 정의할 수 있지만, Convenience Initializer 보다 적은 수로 정의된다.  

모든 클래스는 하나 이상의 Designated Initializer를 갖는다.  
자손 클래스는 Designated Initializer를 갖지 않을 수 있다.

Convenience Initialize  
초기화를 좀 더 쉽게 도와주는 역할을 한다.  
자신의 내부에서 Designated Initialize를 호출한다.  

클래스의 초기화 위임  

1. 자식클래스의 Designated Initializer는 부모클래스의 Initializer를 반드시 호출해야 한다.
2. Convenience Initializer는 자신의 정의된 클래스의 다른 Initializer를 반드시 호출해야 한다.
3. Convenience Initializer는 궁극적으로는 Designated Initializer를 반드소 호출해야 한다.

2단계 초기화
클래스 초기화는 two-phase  
> 1단계 : 클래스에 정의된 각각의 저장 프로퍼티에 초깃값이 할당된다.  
> 2단계 : 저장 프로퍼티들이 커스터마이즈될 기회를 갖는다. 비로소 새 인스턴스가 사용될 준비가 된다.

1. 자식 클래스의 Designated Initializer가 부모 클래스의 Initializer를 호출하기 전에 자신의 프로퍼티를 모두 초기화했는지 확인한다.
2. 자식클래스의 Designated Initializer는 상속받은 프로퍼티에 값을 할당하기 전에 반드시 부모 클래스의 Initializer를 호출해야 한다.
3. Convenience Initializer는 자신의 클래스에 정의된 프로퍼티를 포함하여 그 어떤 프로퍼티라도 값을 할당하기 전에 다른 Initializer를 호출해야 한다.
4. 초기화 1단계를 마치기 전까지는 Initializer는 인스턴스 메서드를 호출할 수 없다. 

2017-02-27

> 스위프트의 이니셜라이저는 부모클래스의 이니셜라이저를 상속받지 않는다.

기본 이니셜라이저 이외 Designated Initializer를 자식 클래스에서 동일한 이름으로 정의하려면 `override`를 명시해야 한다.

**자식 클래스에서 프로퍼티 기본값을 모두 제공한다고 가정할 때**,  

1. 자식 클래스에서 별도의 Designated Initializer를 구현하지 않는다면, 부모 클래스의 Designated Initializer가 자동으로 상속된다.  
2. 1의 경우에 따라 자동 상속 받은 경우 또는 부모클래스의 Designated Initializer 를 모두 재정의하여 부모 클래스와 동일한 Designated Initializer를 모두 사용할 수 있는 상황이라면 *부모 클래스의 Convenience Initializer가 모두 자동으로 상속*된다.




