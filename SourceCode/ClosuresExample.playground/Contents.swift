import UIKit

let c = {(str: String) -> String in return "Hello, \(str)"}
c("Swift")
//let result = c("Swift")
//print(result)

func perform(_ c: (String) -> String) {
  let r = c("Swift")
  print(r)
}

//perform(c)
//perform({str in return "Hello, \(str)"
//})

perform{ "Hello, \($0)"}
var index = 0
if let url = URL(string: "http://www.apple.com") {
  let str = try String(contentsOf: url)
  str.enumerateLines(invoking: {
    print("\(index) : \($0)")
    index += 1
    
    if index > 10 {
      $1 = true
    }
  })
}
