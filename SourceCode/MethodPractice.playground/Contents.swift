import UIKit

struct Lecture {
  let title: String
  let maxStudents: Int
  var numberOfRegistered: Int = 0
  
  init(title: String, maxStudents: Int) {
    self.title = title
    self.maxStudents = maxStudents
  }
  
  init(title: String) {
    self.title = title
    self.maxStudents = 10
  }
  
  func remainSeats() -> Int {
    let remainSeats = maxStudents - numberOfRegistered
    return remainSeats
  }
  
  mutating func register() {
    numberOfRegistered += 1
  }
  
  static var target: String = "Anybody want to learn something"
}


var lec = Lecture(title: "iOS Basic", maxStudents: 20)
lec.remainSeats()

for _ in 0..<5 {
  lec.register()
}

lec.remainSeats()

Lecture.target

struct Math {
  static func abs(value: Int) -> Int {
    if value >= 0 {
      return value
    } else {
      return -value
    }
  }
}

Math.abs(value: 20)
Math.abs(value: -3)

extension Math {
  static func square(value: Int) -> Int {
    return value * value
  }
  
  static func half(value: Int) -> Int {
    return value / 2
  }
}

Math.square(value: 3)
Math.half(value: 6)

extension Int {
  func square() -> Int {
    return self * self
  }
  
  mutating func doubled() {
    self = self * 2
  }
}

var num = 3
num.doubled()

let newNumber = num.square()
