import UIKit

struct PersonStruct {
  var firstName: String
  var lastName: String
  var fullName: String {
    return "\(firstName) \(lastName)"
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
}
