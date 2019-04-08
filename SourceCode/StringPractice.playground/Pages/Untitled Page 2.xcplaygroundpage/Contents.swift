//: [Previous](@previous)

import Foundation

var str = "Hello! * , \r \n \t playground \n \t!"

extension String {
  var removingControlCharacters: String {
    return components(separatedBy: .controlCharacters).joined()
  }
}

extension String {
  var withoutSpecialCharacters: String {
    return self.components(separatedBy: CharacterSet.symbols).joined(separator: "")
  }
}
print(str)
print("\n================[구분]================\n")
print(str.removingControlCharacters)

print(str.withoutSpecialCharacters)

//: [Next](@next)
