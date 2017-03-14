2017-02-06

[api guidelines](https://swift.org/documentation/api-design-guidelines/)

print, dump  
String Interpolation

기본 데이터 타입은 구조체를 타입의 기반으로 삼아 익스텐션, 제네릭 등을 사용하여 구현되어 있다.  
Int는 ~+, -~ 부호를 포함한 정수, 이 중 ~-~ 부호를 포함하지 않는 0을 포함한 양의 정수는 UInt로 표현한다. 둘은 각각 8비트, 16비트, 32비트, 64비트의 형태를 가지고 있다.  
Float와 Double은 부동소수점을 사용하는 실수형. Double은 64비트,  Float는 32비트  
Any에는 모든 데이터 타입을 할당할 수 있다. AnyObject에는 클래스의 인스턴스만 할당할 수 있다.  
Never 타입은 특정 함수의 반환 타입으로 사용될 수 있다.

데이터 타입에 별칭을 부여할 수 있다. `typealias`  
튜플은 타입 이름이 따로 없으며, 일정 타입의 나열로 생성 가능하다. 튜플을 별칭으로 사용할 수 있다.  
배열. `first`, `last`
세트는 순서가 중요하지 않거나 각 요소가 유일한 값을 가져야 하는 경우 사용한다. 배열과 달리 축약형(`[Int]`) 없다.
```swift
var names: Set<String> = Set<String>() // 빈 세트
var names: Set<String> = [] // 빈 세트

intersection, symmetricDifference, union, subtracting, isDisjoint, isSubset, isSuperset
``` 
> 옵셔널은 enum 으로 구현되어 있다.

열거형은 수정 불가. 각 항목이 그 자체로 고유의 값이 될 수 있다. raw value 형태로 실제 값을 가질 수 있다. switch 제어문. 연관 값.  
순환 열거형 `indirect` 열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때 사용한다. 특정 항목에 한정하거나, 열거형 전체에 적용할 수 있다.
```swift
enum ArithmeticExpression {
    case number(Int)
    indirect case addtion(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression {
    case number(Int)
    case addtion(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addtion(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
```
`indirect` 키워드는 이진 탐색 트리 등 순환 알고리즘을 사용할 때 유용하게 사용 가능하다.
