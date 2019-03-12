//: # CaseIterable
//: A type that provides a collection of all of its values.
//: ## Overview
//: Types that conform to the CaseIterable protocol are typically enumerations without associated values. When using a CaseIterable type, you can access a collection of all of the type’s cases by using the type’s allCases property.

//: For example, the CompassDirection enumeration declared in this example conforms to CaseIterable. You access the number of cases and the cases themselves through CompassDirection.allCases.

import UIKit

enum CompassDirection: CaseIterable {
  case north, south, east, west
}

print("There are \(CompassDirection.allCases.count) directions.")

let caseList = CompassDirection.allCases.map({"\($0)"}).joined(separator: ", ")
print(caseList)

