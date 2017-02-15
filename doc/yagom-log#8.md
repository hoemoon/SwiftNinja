2017-02-12

### CH17 : 서브스크립트

클래스, 구조체, 열거형에는  
컬렉션, 리스트, 시퀀스 등의 타입의 요소에 접근하는 단축 문법인 Subscript를 정의할 수 있다.  
별도의 getter나 setter를 구현하지 않아도 인덱스를 통해 값을 설정하거나 가져올 수 있다.  
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

### CH19 : 타입 캐스팅
