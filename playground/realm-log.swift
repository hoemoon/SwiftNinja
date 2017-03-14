class Dog: Object {
    dynamic var name = ""
    dynamic var age = 0
}
class Person: Object {
    dynamic var name = ""
    dynamic var picture: NSData?
    let dogs = List<Dog>()
}

let myDog = Dog()
myDog.name = "Rex"
myDog.age = 1

// Get the default Realm
let realm = try! Realm()
let puppies = realm.objects(Dog.self).filter("age < 2")

pupies.count

D
