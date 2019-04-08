import UIKit

//: # Strings And Characters

// String Literal
"String"

var s = "String"

let c = "C"

let ch: Character = "C"

var nsstr: NSString = "str"

let swiftStr: String = nsstr as String
nsstr = swiftStr as NSString

//: String Mutability

var immutableStr = "str"
immutableStr = "new str"


//: # Multiline String Literals

let loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."


let multiline = """
Lorem ipsum dolor sit amet, \
consectetur adipiscing elit, \
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua.
"""
print(multiline)

var str = "12.34KB"
var size = 12.34
str = "\(size)KB"
size = 56.78
str = "\(size)KB"


//: ## Format Specifier
str = String(format: "%.1fKB", size)

String(format: "Hello, %@", "Swift")
String(format: "%d", 12)
String(format: "%D", 12)
String(format: "%d", 12.34)
String(format: "%d", Int(12.34))

String(format: "%f", 12.34)
String(format: "%.3f", 12.34)
String(format: "%10.3f", 12.34)
String(format: "%010.3f", 12.34)

String(format: "[%d]", 123)
String(format: "[%10d]", 123)
String(format: "[%-10d]", 123)
String(format: "-%d-", 123)

//: ## Localized Format String

let firstName = "Yoon-ah"
let lastName = "Im"

var engFormat = "Her name is %1$@ %2$@."
var korFormat = "그녀의 이름은 %2$@ %1$@ 입니다."

String(format: engFormat, firstName, lastName)
String(format: korFormat, firstName, lastName)

str = "\\"
print(str)

"Hello"
"\"Hello\""

"A\tB"
"C\nD"


//: # String Index

str = "Swift"

let firstCh = str[str.startIndex]

//let lastCh = str[str.endIndex]
var lastCharIndex = str.index(before: str.endIndex)
let lastCh = str[lastCharIndex]

let secondCharIndex = str.index(after: str.startIndex)
let secondCh = str[secondCharIndex]

var thirdCharIndex = str.index(str.startIndex, offsetBy: 2)
var thirdCh = str[thirdCharIndex]

thirdCharIndex = str.index(str.endIndex, offsetBy: -3)
thirdCh = str[thirdCharIndex]

if thirdCharIndex < str.endIndex && thirdCharIndex >= str.startIndex {
  print("confirm valid")
}

//: # Basic Task

str = "Hello, Swift String"

var emptyStr = ""
emptyStr = String()

let a = String(true)
let b = String(12)
let cString = String(12.34)

let d = String(str)

let hex = String(123, radix: 16)
let octal = String(123, radix: 8)
let binary = String(123, radix: 2)

let repeatStr = String(repeating: "👏", count: 7)

let unicode = "\u{1f44f}"

let e = "\(a) \(b)"
let f = a + b

str += "!!"

//: ### 문자열 길이
str.count
str.isEmpty

str == "Apple"
"apple" != "Apple"

"apple" < "Apple"

//: ### 문자열 유틸리티
str.lowercased()
str.uppercased()
str.capitalized

//: # Substring

str = "Hello, Swift"
let l = str.lowercased()

var first = str.prefix(1)

typealias SubSequence = Substring

first.insert("!", at: first.endIndex)

str
first

let newStr = String(first)

//: ## 범위 추출

//str.substring(to: str.index(str.startIndex, offsetBy: 2))

let lower1 = str.startIndex
let upper1 = str.index(str.startIndex, offsetBy: 2)
//s = str[lower1 ..< upper1]
//s = str[..<upper1]

//: # String Editing

str = "Hello"
str.append(", ")
str

s = str.appending("Swift")

"File size is ".appendingFormat("%.1f", 12.3456)

str = "Hello Swift"
let idx = str.index(str.startIndex, offsetBy: 5)
str.insert(",", at: idx)

if let sIndex = str.firstIndex(of: "S") {
  str.insert(contentsOf: "Awesome ", at: sIndex)
}

str = "Hello, Objective-C"
if let range = str.range(of: "Objective-C") {
  str.replaceSubrange(range, with: "Swift")
}

if let range = str.range(of: "Hello") {
  let s = str.replacingCharacters(in: range, with: "Hi")
  s
  str
}

str
var result = str.replacingOccurrences(of: "Swift", with: "Awesome Swift")
result

result = str.replacingOccurrences(of: "swift", with: "Awesome Swift")

result = str.replacingOccurrences(of: "swift", with: "Awesome Swift", options: [.caseInsensitive])
result

//: ## 문자열 삭제

str = "Hello, Awesome Swift!!!"
lastCharIndex = str.index(before: str.endIndex)
var removed = str.remove(at: lastCharIndex)
removed

str.removeFirst()
removed
str

str.removeFirst(2)
str


removed = str.removeLast()
removed
str

str.removeLast(2)
str

if let range = str.range(of: "Awesome") {
  str.removeSubrange(range)
  str
}

str.removeAll()
str.removeAll(keepingCapacity: true)

