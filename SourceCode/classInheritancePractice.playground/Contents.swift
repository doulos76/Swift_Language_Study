import UIKit

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Person {
  var firstName: String
  var lastName: String
  
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  
  func printMyName() {
    print("My name is \(firstName) \(lastName)")
  }
}

class Student: Person {
  var grades: [Grade] = []
  
  required override init(firstName: String, lastName: String) {
    super.init(firstName: firstName, lastName: lastName)
  }
  
  // designated initializer
  convenience init(transfer: Student) {
    self.init(firstName: transfer.firstName, lastName: transfer.lastName)
  }
  
  func recordGrade(_ grade: Grade) {
    grades.append(grade)
  }
}

//let jay = Person(firstName: "Jay", lastName: "Lee")
//let jason = Student(firstName: "Jason", lastName: "Lee")

//jay.firstName
//jason.firstName


//let math = Grade(letter: "B", points: 8.5, credits: 3.0)
//let history = Grade(letter: "A", points: 10.0, credits: 3.0)

//jason.recordGrade(math)
//jason.recordGrade(history)
//jason.grades.count

//jay.recordGrade(math)

// Person: Base Class (Super Class, Parent Class)
// Student: Sub Class
// 1 개의 Super class만 상속 받을 수 있음
// 상속의 깊이는 상관 없음

class StudentAthlete: Student {
  var minimumTraingTime: Int = 2
  var trainedTime: Int = 0
  var sports: [String]
  
  required init(firstName: String, lastName: String) {
    // phase 1
    self.sports = []
    super.init(firstName: firstName, lastName: lastName)
  }
  
  init(sports: [String], firstName: String, lastName: String) {
    // phase 1
    self.sports = sports
    super.init(firstName: firstName, lastName: lastName)
    // phase 2
    train()
  }
  
  func train() {
    trainedTime += 1
  }
}

class FootbollPlayer: StudentAthlete {
  var footballTeam = "FC Swift"
  override func train() {
    trainedTime += 2
  }
}

//var athlete1 = StudentAthlete(firstName: "YN", lastName: "Kim")
//athlete1.trainedTime
//athlete1.train()
//athlete1.trainedTime
//
//var athlete2 = FootbollPlayer(firstName: "HM", lastName: "Son")
//athlete2.trainedTime = 0
//athlete2.train()
//athlete2.trainedTime
//athlete2.footballTeam
//
//func printFirstName(_ person: Person) {
//  print("---> first name: \(person.firstName)")
//}
//
//printFirstName(athlete1)
//printFirstName(jay)
//
//// UpCasting
//athlete1 = athlete2 as StudentAthlete
//athlete1.train()
//athlete1.trainedTime
////athlete1.footballTeam
//
//// DownCasting
//if let son = athlete1 as? FootbollPlayer {
//  print("---> name: \(son.lastName), team: \(son.footballTeam)")
//}
//
//athlete1.firstName
//type(of: athlete1)


// 2-phase Initialization

// * designated vs. convenience initializer
// DI는 자신의 부모의 DI를 호출해야 함
// CI는 같은 클래스의 이니셜라이저를 꼭 하나 호출해야 함
// CI는 궁극적으로는 DI를 호출해야 함

// When shouid use subclass?
// 중복되는 코드 제거
// 깊어지면 복잡해져서 유지보수 어려워질 수 있음
// 개발철학 필요
// 1. Single Responsibility : 단일 책임 - 각 class는 한 개의 고려사항만 있으면 됨 (예: 골키퍼는 골을 지키는 것이 임무)
// 2. Type Safety
// 3. Shared Base Classes
// 4. Extensiblility (확장성)
// 5. Identity
