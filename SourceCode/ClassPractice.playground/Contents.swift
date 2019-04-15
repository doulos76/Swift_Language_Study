import UIKit

struct PersonStruct {
  var firstName: String
  var lastName: String
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
  
  mutating func uppercaseName() {
    firstName = firstName.uppercased()
    lastName = lastName.uppercased()
  }
}

class PersonClass {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
  
  func uppercaseName() {
    firstName = firstName.uppercased()
    lastName = lastName.uppercased()
  }
}

var person1 = PersonStruct(firstName: "Jason", lastName: "Lee")
let person2 = person1

person1.firstName = "Jay"
person1.firstName
person2.firstName

var person3 = PersonClass(firstName: "Jason", lastName: "Lee")
var person4 = person3

person3.firstName = "Jay"
person3.firstName
person4.firstName

person4 = PersonClass(firstName: "Bob", lastName: "Lee")
person4.firstName
person3.firstName

person4 = person3
person4.firstName
person3.firstName

