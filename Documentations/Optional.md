# Optional

__Optional__ 은 '값이 없음'을 표현하는 새로운 개념. 참조형식과 값형식에 구분 없이 `nil`을 사용해 "값이 없음"을 표현함.

## Optinal Type

Swift에서 nil값을 가질 수 있는(즉, 유효한 값이 저장되어 있지 않을 수도 있는) 참조 형식과 값 형식을 옵셔널 타입이라고 함.

초기값을 지정하지 않을 경우 `nil`로 초기화됨. 후에 유효한 값을 할당하거니 nil을 할당 할 수 있음.

Non-Optional Type : nil값을 가질 수 없는 나머지 형식

non-optinal type에 nil 이나 옵셔널 형식의 값을 할당할 경우 compile error 발생

### 문법

```Swift
var 변수이름: 자료형?
let 변수이름: 자료형?
```

## Wrapping & Unwrapping

Optinal 형식은 Wrapping 되어 있음

옵셔널에 저장된 것을 추출하는 것이 Unwrapping임

### 강제 추출 (Forced Unwrapping)
```Swift
OptinalExpression!
```

```Swfit
var optionalStr: String? = "hello"
print(optionalStr!)
// hello
```

저장되어 있지 않은 상태에서 추출하면 error 발생

```Swift
var optionalStr: String?
print(optionalStr!)
// Error
```

### 암시적 추출(IUO, Implicityly Unwrapped Optional)

```Swift
var 변수이름: 자료형!
let 변수이름: 자료형!
```

## Optional Binding

```Swift
if let 상수이름 = 옵셔널표현식 {
	바인딩이 성공했을 때 실행할 코드
}

var optionalStr: String? = "hello"
if let str = optionalStr {
	print(str)
}
// hello
```

옵셔널 표현식 부분에 옵셔널 변수 또는 옵셔널 형식을 리턴하는 메서드 호출등이 옴

옵셔널 표현식의 최종 값이 nil이 아니라면 값이 상수이름으로 선언한 상수에 할당됨

이 상수는 바인딩이 성공했을 때 실행할 코드에서만 사용할 수 있는 임시 상수

만약 옵셔널 표현식의 자료형이 String? 이라면 이 상수의 자료형은 String이 됨.

"상수 이름 = 옵셔널 표현식" 부분을 하나로 묶어 바인딩 항목 또는 Binding이라고 부름












