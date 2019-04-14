import UIKit

var scoreDic = ["Jason": 80, "Jay": 95, "Jake": 90]
//var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]
//var scoreDic: Dictionary<String, Int> = ["Jason": 80, "Jay": 95, "Jake": 90]

print(scoreDic)

scoreDic["Jake"]
scoreDic["jerry"]

scoreDic.isEmpty
scoreDic.count
scoreDic["Jason"] = 99

scoreDic["Jason"]

scoreDic["Jack"] = 100
scoreDic["Jack"]

scoreDic
scoreDic["Jack"] = nil
scoreDic

for (name, score) in scoreDic {
  print("\(name): \(score)")
}

for key in scoreDic.keys {
  print("key : \(key)")
}

for value in scoreDic.values {
  print(value)
}

// 1. 이름, 직업, 도시
var myProfile = ["name": "MinHoi Goo", "job": "Developer", "city": "LA"]
// 2. 도시를 부산으로 업데이트
myProfile["city"] = "Pusan"
// 3. 딕셔너리를 받아서 이름과 도시를 print하는 함수

func printNameAndCity(dictionary: Dictionary<String, Any>) {
  if let name = dictionary["name"], let city = dictionary["city"] {
    print("* name: \(name)\n* city: \(city)")
  } else {
    print("cannot find")
  }
}

printNameAndCity(dictionary: myProfile)
printNameAndCity(dictionary: ["name": "MinHoi Goo", "job": "Developer"])
