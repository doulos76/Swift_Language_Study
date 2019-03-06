//: [Previous](@previous)

//: # Protocol Syntax
/*:
import Foundation

protocol SomeProtocol {
  // protocol definition goes here
}

struct SomeStructure: FirstProtocol, AnotherProtocol {
  // structure definition goes here
}

class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
  // class definition goes here
}
*/

//: # Property Requirements

protocol SomeProtocol {
  var mustBeSettable: Int { get set }
  var doesNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
  static var someTypeProtperty: Int { get set }
}

protocol FullyNamed {
  var fullName: String { get }
}

struct Person: FullyNamed {
  var fullName: String
}

let john = Person(fullName: "John Appleseed")

class Starship: FullyNamed {
  var prefix: String?
  var name: String
  init(name: String, prefix: String? = nil) {
    self.name = name
    self.prefix = prefix
  }
  var fullName: String {
    return (prefix != nil ? prefix! + " " : "") + name
  }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)


//: [Next](@next)
