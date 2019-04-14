import UIKit

struct Lecture: CustomStringConvertible {
  let name: String
  let teacher: String
  let numberOfStudents: Int
  
  var description: String {
    return "Title: \(name), Teacher: \(teacher)"
  }
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

print(lec1)
