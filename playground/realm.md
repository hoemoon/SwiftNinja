# Model

Realm의 데이터 모델은 보통의 스위프트 클래스와 프로퍼티로 정의된다. Object 또는 기존 모델을 상속하면 데이터 모델 객체를 만들 수 있다. 렘 모델 객체는 다른 스위프트 객체와 비슷하게 동작한다. 메서드나 프로토콜을 추가할 수 있다. 한 가지 제약점은 오브젝트를 생성한 쓰레드에서만 사용할 수 있다는 것이다.

```swift
class Dog: Object {
    dynamic var name = ""
    dynamic var owner: Person? // Properyies can be optional
}
class Person: Object {
    dynamic var name = ""
    dynamic var birthdate = NSDate(timeIntervalSince1970: 1)
    let dogs = List<Dogs>()
}
```

프로그램이 실행되면서 정의된 모델이 모두 파싱되기 떄문에 사용되지 않을 지라도 모든 모델은 유효해야 한다. 

스위프트에서 렘을 사용할 때, `Swift.reflect(_:)` 함수를 사용해 모델에 대한 정보를 결정한다. 당연히 초기화 함수의 성공이 필요하고, 이것은 모든 옵셔널이 아닌 값들은 기본값을 가져야 한다는 것을 의미한다.

`Object`
렘 모델 객체를 정의할 때 사용되는 클래스이다.  

```swift
open class Object: RLMObjectBase, ThreadConfined
```

### Supported Types

```swift
Bool, Int8, Int16, Int32, Int64, Double, Float, String, NSDate, NSData
```

`String`, `NSdate`, `NSData` 는 옵셔널일 수 있다. `Object` properties must be optional. `RealmOptional`을 이용해 옵셔널 숫자를 저장한다.

### Relationships

`Object`들은 `Object`와 `List`를 이용해 서로 연결될 수 있다. `List`들은 배열과 매우 유사한 인터페이스를 가지고 있다. `Object`가 포함된 `List`는 서브스크립트를 통해 접근 가능하다. 하지만 배열과 달리 Lists only hold `Object`s of a single subclass type. 

### To-One Relationships

`Object`를 상속받는 클래스에 프로퍼티를 선언하는 것으로 many-to-one, one-to-one 관계를 구현할 수 있다.

```swift
class Dog: Object {
    dynamic var owner: Person?
}
let jim = Person()
let rex = Dog()
rex.owner = jim
```

`Object` 프로퍼티를 이용할 때, 일반적인 문법을 이용해 중첩된 프로퍼티에 접근할 수 있다. `rex.owner?.address.country`

### To-Many Relationships

`List` 프로퍼티를 이용해 to-many relationship 관계를 정의할 수 있다. `List`는 하나의 타입의 다른 `Object`들을 포함하고, 변경 가능한 배열과 매우 비슷한 인터페이스를 가지고 있다.

```swift
class Person: Object {
    let dogs = List<Dog>()
}
let someDogs = realm.objects(Dog.self).filter("name contains 'Fido'")
jim.dogs.append(objectsIn: someDogs)
jim.dogs.append(res)
```

### Inverse Relationships

`Link`는 단방향이다. 그래서 to-many 프로퍼티 `Person.dogs`와 `Dog` 인스턴스의 연결,  
to-one 프로퍼티 `Dog.owner`와 `Person`의 연결  
두 연결은 서로 독립적이다.  
자동으로 연결하면 위험하기 때문에 렘은 `linking object` 프로퍼티를 제공한다.

이 프로퍼티를 사용하면, 연결된 특정 프로퍼티를 모두 가져올 수 있다.

```swift
class Dog: Object {
    dynamic var name = ""
    dynamic var age = 0
    let owners = LinkingObjects(fromType: Person.self, property: "dogs")
}
```

### Optional Properties

`Stirng`, `NSDate`, `NSData`는 옵셔널일 수 있다. 옵셔널 숫자 타입은 `RealmOptional`을 이용해 선언 된다.

```swift
class Person: Object {
    dynamic var name: String: nil
    let age = RealmOptional<Int>()
}
let realm = try! Realm()
try! realm.write() {
    var person = realm.create(Person.self, value: ["Jane", 27])
    // Reading from or modifying a `RealmOptional` is done via the `value` property
    person.age.value = 28
}
```

`RealmOptional`은 Int, Float, Double, Bool을 지원한다.

### Property Attributes

렘 모델 프로퍼티는 `dynamic var` 속성이 필요하다.

두 가지 예외 : `List`, `RealmOptional` 프로퍼티는 dynamic으로 선언될 수 없다.  because generic properties cannot be represented in the Objective‑C runtime, which is used for dynamic dispatch of dynamic properties  
`let`으로 선언되어야 한다.

### Indexed Properties

`Object.indexedProperties()`를 재정의하면 해당 프로퍼티는 인덱스 된다.

```swift
class Book: Object {
    dynamic var price = 0
    dynamic var title = ""
    override static func indexedProperties() -> [String] {
        return ["title"]
    }
}
```

렘은 string, integer, boolean, NSDate 의 인덱싱을 지원한다. 

프로퍼티를 인덱싱하면 동등 비교를 이용한 쿼리의 속도가 빨라진다. 대신 삽입 속도는 느려진다.

### Auto-Updating Objects

렘 객체는 refresh 되지 않는다. 객체의 프로퍼티를 수정하면 즉시 다른 인스턴스에도 반영된다.

렘 객체의 수정을 알려면 Realm notifications를 구독할 수 있다. UI가 리프레쉬 되어야 하는지 알려준다. 대안으로 key-value observation 을 사용할 수도 있다.

### Primary Keys

`Object.primaryKey()`를 재정의 하면 모델의 primary key를 정할 수 있다. primary key는 변경될 수 없다.

```swift
class Person: Object {
    dynamic var id = 0
    dynamic var name = ""
    override static func primaryKey() -> String? {
        return "id"
    }
}
```

### Ignored Properties

`Object.ignoredProperties()`를 재정의하면 저장되지 않는다. 일반적인 조작은 가능하다.

```swift
class Person: Object {
    dynamic var tempID = 0
    var name: String { // real-only properties are automatically ignored
        return "\(firstName) \(lastName)"
    }
    dynamic var firstName = ""
    dynamic var lastName = ""
    override static func ignoredProperties() -> [String] {
        return ["tmpID"]
    }
}
```

해당 프로퍼티는 당연히 쿼리 불가능. 노티를 트리거 하지도 않는다. 하지만 KVO-observation는 동작한다.


























