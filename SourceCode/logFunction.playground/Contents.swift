import UIKit

//: # debugPrint

let yearString = "2019"

print(yearString)
debugPrint(yearString)

let yearStringInt = 2019

print(yearStringInt)
debugPrint(yearStringInt)


enum TextAlignment { case Left, Right, Center }
enum ViewAlignment { case Left, Right, Center }

print(TextAlignment.Center)
print(ViewAlignment.Center)

debugPrint(TextAlignment.Center)
debugPrint(ViewAlignment.Center)

//: #dump

let pt = CGPoint(x: 12, y: 34)
print(pt)

dump(pt)
