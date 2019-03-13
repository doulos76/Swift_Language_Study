//: # Filter

import UIKit

let numbers = [ 3 , 5, 9, 12, 14, 19]
let filtered = numbers.filter { (num) -> Bool in
  return num < 10
}

extension Array {
  func filteredElements(filterFunc: (Element) -> Bool) -> [Element] {
    var allElements = [Element]()
    self.forEach { (element) in
      if filterFunc(element) {
        allElements.append(element)
      }
    }
    return allElements
  }
}

let evenNumbers = [1, 2, 3, 4, 5].filteredElements { (num) -> Bool in
  return num % 2 == 0
}
print(evenNumbers)

let dogs = ["big-dog", "small-dog", "small-cat", "medium-cat"].filteredElements { (pet) -> Bool in
  return pet.contains("dog")
}
print(dogs)
