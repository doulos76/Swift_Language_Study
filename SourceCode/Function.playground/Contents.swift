import UIKit

// 1. 성, 이름을 받아서 fullname을 출력하는 함수 만들기
func makeFullname(firstName: String, lastName: String) {
  print("fullname: \(firstName) \(lastName)")
}

// 2. 1번에서 만든 함수인데, parameter이름을 제거하고 fullname 출력하는 함수 만들기
func makeFullnameWithoutArguments(_ firstName: String, _ lastName: String) {
  print("fullname: \(firstName) \(lastName)")
}

// 3. 성, 이름을 받아서 fullname return 하는 함수 만들기
func returnFullname(firstName: String, lastName: String) -> String {
  let fullName = "\(firstName) \(lastName)"
  return fullName
}

makeFullname(firstName: "James", lastName: "Jang")
makeFullnameWithoutArguments("Kim", "Kang")
let yourName = returnFullname(firstName: "김", lastName: "사랑")
print(yourName)
