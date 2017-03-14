class Person {
    var name: String = ""
    var age: Int = 0
    var introdution: String {
        return "name: \(name), age: \(age)"
    }
    func speak() {
        print("abcdefg")
    }
    class func introduceClass() -> String {
        return "peace"
    }
}

class Student: Person {
    var grade: String = "F"
    func study() {
        print("Study hard")
    }
    override func speak() {
        print("I'm a student.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    class func introduceClass() {
        print(super.introduceClass())
    }
    override class func introduceClass() -> String {
        return "give me A++"
    }
    override func speak() {
        super.speak()
        print("I'm university student.")
    }
}

print(Person.introduceClass())
print(Student.introduceClass())
print(UniversityStudent.introduceClass() as String)
UniversityStudent.introduceClass() as Void

// 프로퍼티 재정의
class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return self.age + 1
    }
    var introdution: String {
        return "name: \(name). age: \(age)"
    }
}

class Student: Person {
    var grade: String = "F"
    override var introdution: String {
        return super.introdution + " " + "grade : \(self.grade)"
    }
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
}

// 프로퍼티 감시자 재정의
class Person {
    var name: String = ""
    var age: Int = 0 {
        didSet {
            print("Person age : \(self.age)")
        }
    }
    var koreanAge: Int {
        return self.age + 1
    }
    var fullName: String {
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
}

class Student: Person {
    var grade: String = "F"
    override var age: Int {
        print("Student age: \(self.age)")
    }
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
        didSet { } // error
    }
    override var fullName: String {
        didSet {
            print("Full name : \(self.fullName)")
        }
    }
}

// 서브스크립트 재정의
class School {
    var students: [Student] = [Student]()
    subscript(number: Int) -> Student {
        print("School subscript")
        return students[number]
    }
}
class MiddleSchool: School {
    var middleStudents: [Student] = [Student]()
    override subscript(index: Int) -> Student {
        print("MiddleSchool Student")
        return middleStudents[index]
    }
}

// 재정의 방지
class Person {
    final var name: String = ""
    final func speak() {
        print("abcdefghijklmnopqrstubwxyz")
    }
}

final class Student: Person { }

// 클래스 이니셜라이저 재정의
class Person {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

class Student: Person {
    var major: String
    override init(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    convenience init(name: String) {
        self.init(name: name, age: 7)
    }
}

// 실패 가능한 이니셜라이저의 재정의
class Person {
    var name: String
    var age: Int
    init() {
        self.name = "Unknown"
        self.age = 0
    }
    init?(name: String, age: Int) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
    }
    init?(age: Int) {
        if age < 0 {
            return nil
        }
        self.name = "Unknown"
        self.age = age
    }
}

class Student: Person {
    var major: String
    override init?(name: String, age: Int) {
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    override init(age: Int) {
        self.major = "Swift"
        super.init()
    }
}
// 이니셜라이저 자동 상속
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "Unknown")
    }
}
class Student: Person {
    var major: String = "Swift"
}

// 편의 이니셜라이저 자동 상속
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Student: Person {
    var major: String
    override init(name: String) {
        self.major = "Unknown"
        super.init(name: name)
    }
    init(name: String, major: String) {
        super.init(name: name)
    }
}

// 편의 이니셜라이저 자동 상속 2
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "Unknwon")
    }
}

class Student: Person {
    var major: String
    convenience init(major: String) {
        self.init()
        self.major = major
    }
    override convenience init(name: String) {
        self.init(name: name, major: "Unknwon")
    }
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}

// 편의 이니셜라이저 자동 상속 3
class UniversityStudent: Student {
    var grade: String = "A+"
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    convenience init(name: String, major: String, grade: String) {
        self.init(name: name, major: major)
        self.grade = grade
    }
}