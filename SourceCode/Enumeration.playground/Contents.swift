import UIKit

enum School: CaseIterable {
  case primary
  case elementary
  case middle
  case high
  case college
  case university
  case graduate
}

let allCases: [School] = School.allCases
print(allCases)


enum School1: String, CaseIterable {
  case primary = "유치원"
  case elementary = "초등학교"
  case middle = "중학교"
  case high = "고등학교"
  case college = "대학"
  case university = "대학교"
  case graduate = "대학원"
}

let allCases1: [School1] = School1.allCases
print(allCases1)

enum ArithmaticExpression {
  case number(Int)
  indirect case addtion(ArithmaticExpression, ArithmaticExpression)
  indirect case multiplication(ArithmaticExpression, ArithmaticExpression)
}

//indirect enum ArithmaticExpression {
//  case number(Int)
//  case addtion(ArithmaticExpression, ArithmaticExpression)
//  case multiplication(ArithmaticExpression, ArithmaticExpression)
//}


