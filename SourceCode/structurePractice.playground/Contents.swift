import UIKit

func distance(current: Location, target: Location) -> Double {
  let distanceX = Double(target.x - current.x)
  let distanceY = Double(target.y - current.y)
  let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
  return distance
}

struct Location {
  let x: Int
  let y: Int
}

struct Store {
  let loc: Location
  var name: String
  let deliveryRange = 2.0
  
  func isDeliverable(userLoc: Location) -> Bool {
    let distanceToStore = distance(current: userLoc, target: loc)
    return distanceToStore < deliveryRange
  }
  
}

let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")

func printClosestStore(currentLocation: Location, stores: [Store]) {
  var closestStoreName = ""
  var closesetStoreDistance = Double.infinity
  var isDelivarable = false
  
  for store in stores {
    let distanceToStore = distance(current: currentLocation, target: store.loc)
    closesetStoreDistance = min(distanceToStore, closesetStoreDistance)
    if closesetStoreDistance == distanceToStore {
      closestStoreName = store.name
      isDelivarable = store.isDeliverable(userLoc: currentLocation)
    }
  }
  print("Closest store: \(closestStoreName) deliverable: \(isDelivarable)")
}

let stores = [store1, store2, store3]
let myLocation = Location(x: 2, y: 5)

printClosestStore(currentLocation: myLocation, stores: stores)

var a: Int = 5
var b: Int = a
var str: String = "a"
print(a)
print(b)

a = 10
print(a)
print(b)

var storeNearBy1 = Store(loc: Location(x: 3, y: 5), name: "GS")
var storeNearBy2 = storeNearBy1

storeNearBy1.name = "CU"

print(storeNearBy1.name)
print(storeNearBy2.name)

// 1. 강의 이름, 강사 이름, 학생수를 가지는 Struct 만들기 (Lecture)
// 2. 강의 Array와 강사 이름을 받아서, 해당 강사의 강의 이름을 출력하는 함수 만들기
// 3. 강의 3개 만들고 강사이름으로 강의 찾기

struct Lecture {
  let name: String
  let teacher: String
  let numberOfStudents: Int
}

func printLectureName(lectures: [Lecture], teacher: String) {
  lectures.forEach { lecture in
    if lecture.teacher == teacher {
      print(lecture.name)
    } else {
      print("없습니다.")
    }
  }
}

func printLectureName(from instructor: String, lectures: [Lecture]) {
  var lectureName = ""
  for lecture in lectures {
    if instructor == lecture.teacher {
      lectureName = lecture.name
    }
  }
  print("lecture name is \(lectureName)")
}

let lecture1 = Lecture(name: "영어", teacher: "이영어", numberOfStudents: 10)
let lecture2 = Lecture(name: "수학", teacher: "김수학", numberOfStudents: 20)
let lecture3 = Lecture(name: "국어", teacher: "최국어어", numberOfStudents: 40)

print("\n================[test]================\n")
let lectures = [lecture1, lecture2, lecture3]
printLectureName(lectures: lectures, teacher: "이영어")
printLectureName(lectures: lectures, teacher: "김수학")
printLectureName(lectures: lectures, teacher: "최국어")


let lec1 = Lecture(name: "iOS Basic", teacher: "Jason", numberOfStudents: 5)
let lec2 = Lecture(name: "iOS Advanced", teacher: "Jack", numberOfStudents: 5)
let lec3 = Lecture(name: "iOS Pro", teacher: "Jim", numberOfStudents: 5)
let lectures1 = [lec1, lec2, lec3]
printLectureName(from: "Jim", lectures: lectures1)
