//: [Previous](@previous)
//: Stored Properties

import Foundation

struct Point {
  var x = 0.0, y = 0.0
}

struct Size {
  var width = 0.0, height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}
//
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
//Prints "square.origin is now at (10.0, 10.0)"

//: Shorthand Setter Declaration
struct AlternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set {
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}

//: Read-Only Computed Properties

struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  var volume: Double {
    return width * height * depth
  }
}
let fourByFiveTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"

//: Property Observer
class StepCounter {
  var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
      print("About to set totalSteps to \(newTotalSteps)")
    }
    didSet {
      if totalSteps > oldValue {
        print("Added \(totalSteps - oldValue) steps")
      }
    }
  }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
//About to set totalSteps to 200
//Added 200 steps
stepCounter.totalSteps = 360
//About to set totalSteps to 360
//Added 160 steps
stepCounter.totalSteps = 896
//About to set totalSteps to 896
//Added 536 steps


//: Type Property Syntax

struct SomeStructure {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 1
  }
}
enum SomeEnumeration {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 6
  }
}
class SomeClass {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 27
  }
  class var overrideableComputedTypeProperty: Int {
    return 107
  }
}

print(SomeStructure.storedTypeProperty)
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"


struct AudioChannel {
  static let thresholdLevel = 10
  static var maxInputLevelForAllChannels = 0
  var currentLevel: Int = 0 {
    didSet {
      if currentLevel > AudioChannel.thresholdLevel {
        // cap the new audio level to the threshold level
        currentLevel = AudioChannel.thresholdLevel
      }
      if currentLevel > AudioChannel.maxInputLevelForAllChannels {
        // store this as the new overall maximum input level
        AudioChannel.maxInputLevelForAllChannels = currentLevel
      }
    }
  }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"
//: [Next](@next)
