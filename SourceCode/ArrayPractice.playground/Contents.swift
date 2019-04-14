import UIKit

var evenNumbers = [2, 4, 6, 8]
//let evenNumbers2: Array<Int> = [2, 4, 6, 8]

evenNumbers.append(10)

evenNumbers += [12, 14, 16]
//evenNumbers.isEmpty
//evenNumbers = []
//evenNumbers.isEmpty
evenNumbers.count
print(evenNumbers.first)

if let firstNumber = evenNumbers.first {
  print("---> first item is \(firstNumber)")
}

evenNumbers.min()
evenNumbers.max()

var secondElement = evenNumbers[1]
//var twentithElement = evenNumbers[19]

let firstThree = evenNumbers[0...2]

evenNumbers.contains(3)
evenNumbers.contains(4)

evenNumbers

evenNumbers.insert(0, at: 0)
evenNumbers

//evenNumbers.removeAll()
evenNumbers.remove(at: 0)
evenNumbers

evenNumbers[0] = -2
evenNumbers

evenNumbers[0...2] = [-2, 0, 2]
evenNumbers

//evenNumbers.swapAt(1, 2)

//for num in evenNumbers {
//  print(num)
//}

for (index, num) in evenNumbers.enumerated() {
  print(index, num)
}

let firstThreeRemoved = evenNumbers.dropFirst(3)
firstThreeRemoved

let lastRemoved = firstThreeRemoved.dropLast()
lastRemoved

let firstThrees = evenNumbers.prefix(upTo: 3)
firstThrees

evenNumbers
let lastThrees = evenNumbers.suffix(3)
lastThrees
