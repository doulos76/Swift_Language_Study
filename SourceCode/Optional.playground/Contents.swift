import UIKit

//var name: String = "Joon"
//var dogName: String = "MOzzi"
//var carName: String = ???

var carName: String?
carName = nil
carName = "땡크"


// 여러분이 최애하는 영화배우의 이름을 담는 변수를 작성해 주세요 ( 타입 String?)
// let num = Int("10") num 타입을 예상해 보기

let myFavoriteMovieStar: String? = "김민정"
myFavoriteMovieStar

// Forced unwrapping optional
// Optional binding
// Guard statement
// Nil coalescing

// Forced unwrapping optional > 억지로 박스를 까보기

print(carName!)

// Optional binding > 부드럽게 박스를 까보자

//carName = nil
if let unwrappedCarName = carName {
  print(unwrappedCarName)
} else {
  print("car name 없다!!!")
}

// Guard statement > 부드럽게 박스를 까보자 2탄 (feat. guard)
//func printParsedInt(from: String) {
//  if let parsedInt = Int(from) {
//    print(parsedInt)
//  } else {
//    print("cannot to Int")
//  }
//}

func printParsedInt(from: String) {
  guard let parsedInt = Int(from) else {
    print("cannot to Int")
    return
  }
  print(parsedInt)
}

printParsedInt(from: "100")


// Nil coalescing > 박스를 까보았더니 값이 없으면 디폴트 값 줘보자..
carName = nil
let myCarName = carName ?? "Tesla model s"

// 도전과제
// 최애 음식이름을 담는 변수를 작성하고 (String?), Optional binding을 이용해서 값을 확인하기
var myFavoriteFood: String?
myFavoriteFood = "KimBob"

if let favoriteFood = myFavoriteFood {
  print("좋아하는 음식은 \(favoriteFood) 이다")
} else {
  print("좋아하는 음식 없어?")
}

// 닉네임을 받아서 출력하는 함수를 만들어 보기, 입력 파리미터 String?

var nickName: String?

if let myNickName = nickName {
  print(myNickName)
}

func printNickName(name: String?) {
  guard let nickName = name else {
    print("별명이 없군... 한 번 만들어 봐")
    return
  }
  print("별명은 \(nickName)")
}

printNickName(name: nil)
printNickName(name: "마루치")
