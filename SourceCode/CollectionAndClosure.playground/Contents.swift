import UIKit

let scores = [80, 90, 75, 99]
scores.sorted()

scores.sorted { (int1, int2) -> Bool in
  return int1 > int2
}

let prices = [1500, 30000, 2000, 20000]
// filter
let largePrices = prices.filter { price -> Bool in
  return price > 10000
}

// map
let salesPrices = prices.map { price -> Int in
  return Int(Double(price) * 0.1)
}

// Reduce
let sum = prices.reduce(0) { result, price -> Int in
  return result + price
}

let items = [1500: 5, 30000: 1, 2000: 3, 20000: 2]
let totalPrices = items.reduce(0) { result, item -> Int in
  return result + item.key * item.value
}

1500 * 5 + 30000 + 6000 + 40000

// 1. 이름의 Array 생성하고, reduce를 이용하여 이름을 모두 연결
// 2. 1에서 생성된 Array에서 글자가 3개 이상인 이름을 filter로 걸러내고 걸러낸 이름을 reduce를 이용해서 연결하기
// 3. 학생 dictionary 생성( key: 이름, value: 나이) , filter를 이용해서 20세 이상인 학생만 걸러내기
// 4. 3번에서 걸러낸 학생들을 map을 이용해서 이름만 array로 만들기

// 1
let names = ["Jack", "James", "Matt", "Redman", "Steven", "Jobs", "Mark", "Ka", "Na"]
let allNames = names.reduce("") { result, name in
  return result + " " + name
}

// 2
let filteredNames = names.filter { (name) -> Bool in
  return name.count > 3
  }.reduce("") { (result, name) -> String in
    return result + name
}

let name = names.filter({$0.count > 3}).reduce("", { $0 + $1 })
print(name)

// 3
let students = ["Jack": 12, "Holms": 27, "Steve": 10, "Tom": 22]
let oldStudents = students.filter { $0.value > 20 }.map({$0.key})
print(oldStudents)
