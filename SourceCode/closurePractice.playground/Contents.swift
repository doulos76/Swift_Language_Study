import UIKit

var multiplyClosure: (Int, Int) -> Int = { a, b in
  return a * b
}

let result = multiplyClosure(4, 2)

//

func operateTwoNumber(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  return result
}

operateTwoNumber(a: 4, b: 2, operation: multiplyClosure)

var addClosure: (Int, Int) -> Int = { a, b in
  return a + b
}

operateTwoNumber(a: 4, b: 2, operation: addClosure)

operateTwoNumber(a: 4, b: 2, operation: {a, b in return a / b})

let voidClosure: () -> Void = {
  print("iOS Developer Good!!!")
}

voidClosure()

var count = 0
let incrementer = {
  count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()
count
