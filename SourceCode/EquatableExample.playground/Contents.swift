import UIKit

let students = ["Kofi", "Abena", "Efua", "Kweku", "Akosua"]

let nameToCheck = "Kofi"
if students.contains(nameToCheck) {
  print("\(nameToCheck) is signed up!")
} else {
  print("No record of \(nameToCheck)")
}


class StreetAddress {
  let number: String
  let street: String
  let unit: String?
  
  init(_ number: String, _ street: String, unit: String? = nil) {
    self.number = number
    self.street = street
    self.unit = unit
  }
}

extension StreetAddress: Equatable {
  static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
    return
    lhs.number == rhs.number &&
    lhs.street == rhs.street &&
    lhs.unit == rhs.unit
  }
}

let addresses = [StreetAddress("1490", "Grove Street"),
                 StreetAddress("2119", "Maple Avenue"),
                 StreetAddress("1400", "16th Street")]
let home = StreetAddress("1400", "16th Street")

print(addresses[0] == home)
print(addresses.contains(home))

class IntegerRef: Equatable {
  let value: Int
  init(_ value: Int) {
    self.value = value
  }
  
  static func == (lhs: IntegerRef, rhs: IntegerRef) -> Bool {
    return lhs.value == rhs.value
  }
}

let a = IntegerRef(100)
let b = IntegerRef(100)

print(a == a, a == b, separator: ", ")

let c = a
print(c === a, c === b, separator: ", ")
