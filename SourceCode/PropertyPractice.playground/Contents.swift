import UIKit

struct Person {
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  // stored properties, property observer
  var firstName: String {
    didSet {
      print("firstName is changed from \(oldValue) to \(firstName)")
    }
    //willSet {
    //}
  }
  var lastName: String
  
  lazy var isPopular: Bool = {
    print("---> Checking...")
    if fullName == "Fraddie Mercury" {
      return true
    } else {
      return false
    }
  }()
  
  // computed property
  var fullName: String {
    get {
      return "\(firstName) \(lastName)"
    }
    set {
      if let firstName = newValue.components(separatedBy: " ").first {
        self.firstName = firstName
      }
      if let lastName = newValue.components(separatedBy: " ").last {
        self.lastName = lastName
      }
    }
  }
  
  // typed property
  static var isAlien: Bool = false
}

var person = Person(firstName: "Jason", lastName: "Lee")

person.firstName = "Jim"
person.firstName
person.lastName = "Kim"
person.lastName
person.fullName = "Jason Park"
person.firstName
person.lastName

Person.isAlien

person.isPopular

var fraddie = Person(firstName: "Fraddie", lastName: "Mercury")
fraddie.isPopular

fraddie.fullName

