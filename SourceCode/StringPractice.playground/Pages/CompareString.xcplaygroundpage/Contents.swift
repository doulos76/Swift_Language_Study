//: [Previous](@previous)
//: # Compare String
import Foundation

let largeA = "Apple"
let smallA = "apple"
let b = "Banana"

largeA == smallA
largeA != smallA

largeA < smallA
largeA < b
smallA < b

largeA.compare(smallA) == .orderedSame

largeA.caseInsensitiveCompare(smallA) == .orderedSame

"Swift" == "Swift"
"swift" != "Swift"

let str1 = "Hello, Swift"
let prefix = "Hello"
str1.elementsEqual("Hello, Swift")

//: [Next](@next)
