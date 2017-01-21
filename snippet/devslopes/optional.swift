// devslopes lecture optional 2017-01-20

var lotteryWinnings: Int?
if lotteryWinnings != nil {
    print(lotteryWinnings!)
}
if let winnings = lotteryWinnings {
    print(winnings)
}

class Car {
    var model: String?
}
var vehicle: Car?
if let v = vehicle {
    if let m = v.model {
        print(m)
    }
}
print(vehicle!.model) // crash
print(vehicle?.model) // not crash 
vehicle = Car() // nil
vehicle?.model = "Branco"
if let v = vehicle, let m = v.model {
    print(m) // "Branco"
}

var cars: [Cars]?
var cars = [Car]()
if let carArr = cars where carArr.count < 0 {
  // only execute if not nil and if more than 0 elements
} else {
    cars?.append(Car())
    print(cars?.count) // optional
}

class Person {
    var _age: Int! // i'm definitely going to put a value in here
    var age: Int { // computed property
        if _age == nil {
            _age = 15
        }
    }

    func setAge(newAge: Int) {
        sef._age = newAge
    }
}

var jack = Person()
print(jack._age) // nil
print(jack.age) // 15

class Dog {
    var species: String
    init(someSpecies: String) {
        self.species = someSpecies
    }
}

