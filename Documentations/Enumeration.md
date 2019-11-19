# Enumeration

* Enumeration (열거형)
	* 연관된 항목들을 묶어서 표현할 수 있는 타입. 
	* 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가함. 
	* 정해진 값만 열거형 값에 속할 수 있음

* `enum`이 사용되는 경우
	* 제한된 선택지
	* 정해진 값 외에 입력받고 싶지 않을 경우
	* 예상된 입력 값이 한정되어 있는 경우
 
* Example
	* 무선통신방식: WiFi, Bluetooth, LTE, 3G, etc.
	* 학생 : 초등학생, 중학생, 고등학생, 대학생, 대학원생, 기타
	* 지역 : 강원도, 경기도, 경상도, 전라도, 제주도, 충청도

## 기본 열거형

* 선언 : `enum` keyword 사용

* 열거형 선언 예시

```Swift
enum School {
	case primary
	case elementary
	case middle
	case high
	caee college
	case university
	case graduate
}
```

* 한줄에 선언 가능

```Swift
enum School {
	case primary, elementary, middle, high
}
```

* 열거형 번수 생성 및 값 변경 예시

```Swift
var hightEducationLevel: School = School.high
var hightEducationLevel: School = .high
hightEducationLevel = .college
```

## 원시 값(rawValue)

* 각 case는 rawValue를 가질 수 있다.
* rawValue란 property를 이용해 가져올 수 있다.

```Swift
enum School: String {
	case primary = "유치원"
	case elementary = "초등학교"
	case middle = "중학교"
	case high = "고등학교"
	caee college = "대학"
	case university = "대학교"
	case graduate = "대학원"
}

let hightstEducationLevel = School.university

enum WeekDays: Character {
	case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = WeekDays.fir
print("오늘은 \(today.rawValue)요일입니다.")

prints "오늘은 금요일입니다."
```

## 연관 값(associatedValue)

* Swift의 열거형 각 항목이 연관 값을 가지게 되면, 기존 프로그래밍 언어의 공용체 형태를 뛸 수 있음.
* 열거형 내의 항목이 자신과 연관된 값을 가질 수 있음
* 연관값은 각 항목 옆에 소괄호로 묶어 표현할 수 있음
* 다른 항목이 연관 값을 갖는다고 모든 항목이 연관 값을 가질 필요는 없음.

```Swift
enum MainDish {
	case pasta(taste: String)
	case pizza(dough: String, topping: String)
	case chicken(withSauce: Bool)
	cas rice
}

var dinner: MainDish = MainDish.pasta(taste: "Cream")
dinner = .pizza(dough: "Cheese Cruster", topping: "Ham")
dinner = .chicken(withSauce: true)
dinner = .rice
```

여러 열거형의 응용

```Swift
enum PastaTaste {
	case cream, tomato
}

enum PizzaDough {
	case cheeseCrust, thin, orignal
}

enum PizzaTopping {
	case pepperoni, cheese, bacon
}

enum MainDish {
	case pasta(taste: PastaTaste)
	case pizza(dough: PizzaDough, topping: PizzaTopping)
	case chicken(withSauce: Bool)
	case rice
}

var dinner: MainDish = MainDish.pasta(taste: PastaTaste.tomato)
dinner = MainDish.pizza(dough: PizzaDough.cheeseCrust, topping: PizzaTopping.bacon)
```

## 항목 순회

* 열거형에 포함된 모든 케이스를 알아야 할 때, 열거형의 이름 뒤에 `:`을 작성하고 한 칸 띄운 뒤 `CaseIterable` protocol을 채택. 열거형에 `allCases`라는 이름의 타입 프로퍼티를 통해 모든 케이스의 컬렉션을 생성해 줌.

```Swift
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
```

## 순환 열거형

열거형 항목의 연관 값이 열거형 자신의 값이고자 할 때 사용
`indirect` keyword를 각 case 앞에 붙이고, 전체에 적용할 경우 enum 앞에 붙임

```Swift
enum ArithmaticExpression {
  case number(Int)
  indirect case addtion(ArithmaticExpression, ArithmaticExpression)
  indirect case multiplication(ArithmaticExpression, ArithmaticExpression)
}

indirect enum ArithmaticExpression {
  case number(Int)
  case addtion(ArithmaticExpression, ArithmaticExpression)
  case multiplication(ArithmaticExpression, ArithmaticExpression)
}
```


























