# Properties

_Properties_ associate values with a particular class, structure, or enumeration. Stored properties store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value. Computed properties are provided by classes, structures, and enumberations. Stored properties are provided only by classes and structures.

Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with tye type itself. Such properties are known as type properties.

In addition, you can define property observers to monitor changes in a property's value, which you cna respond to with custom actions. Property observers cna be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.

## Stored Properties

Inits simplest form, a stored perperty is a constant or variable that is stored as part of an instance of a particular class or structure. Stored properties can be either variable stored properties (introduced by the `var` keyword) or _constant stored perperties_ (introduced by the `let` keyword).

You cna provide a default value for a stored property as part of its definition, as described in Default Property Values. You can also set and modify the initial value for a stored property during initialization. This is true even for constant stored properties, as described in Assigning Constant Properties During Initialization.


```Switch
struct FixedLengthRange {
	var firstValue: Int
	let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItmes.firstValue = 6
// the range now represents integer values 6,7, and 8
```

Instances of `FixedLengthRange` have a variable stored property called `firstValue` and a constant stored perperty called `length`. In the example above, `length` is initialized when the new range is created and cannot be changed thereafter. because it is a constant property.

### Stored Properties of Constant Structure Instances

```Swift
let rnageOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property
```

### Lazy Stored Properties

A _lazy_ stored property is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the `lazy` modifier before its declaration.

> __NOTE__
> 
> You must always declare a lazy property as a variable (with the `var` keyword), because its initial value might not be retrieved until after initialization completes. Constant  propertie smust always have a value _before_ initialization completes, and therefore cannot be declared as lazy

```Swift
class DataImporter {
  /*
   DataImporter is a class to import data from an external file.
   The class is assumed to take a nontrivial amount of time to initialize.
 */
  var filename = "data.txt"
  // the DataImporter class would provide data importing functionality here
}

class DataManager {
  lazy var importer = DataImporter()
  var data = [String]()
  // the DataManager class would provide data menagement functionlity here
}

let manager = DataManager()
manager.data.append("Some Data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created
```

```Swift
print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"
```

### Stored Properties and Instance Variables

## Computed Properties

In addition to stored properties, classes, structures and enumerations can define _computed properties_, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

```Swift
struct Point {
  var x = 0.0, y = 0.0
}

struct Size {
  var width = 0.0, height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }
}
//
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
//Prints "square.origin is now at (10.0, 10.0)"
```
### Shorthand Setter Declaration

```Swift
struct AlternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY)
    }
    set {
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}
```

### Read-Only Computed Properties

A computed property with a getter but no setter is known as a _read-only computed property_. A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.

> __Note__
> 
> You must declare computed properties-including read-only computed properties-as variable properties with the `var` keyword, because their value is not fixed. The `let` keyword is only used for constant properties, to indicate that their values cannot be changed once they are sets as part of instance initialization.
> 

```Swift
struct Cuboid {
  var width = 0.0, height = 0.0, depth = 0.0
  var volume: Double {
    return width * height * depth
  }
}
let fourByFiveTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0"
```

## Property Observers

Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

* `willSet` is called just before the value is stored.
* `didSet` is called immediately after the new value is stored.

> __NOTE__
> 
> The `willSet` and `didSet` observers of superclass properties are called when a property is set in a subclass initializer, after the superclass initializer has been called. They are not called while a class is setting its own properties, before the superclass initializer has been called.
> 

```Swift
class StepCounter {
  var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
      print("About to set totalSteps to \(newTotalSteps)")
    }
    didSet {
      if totalSteps > oldValue {
        print("Added \(totalSteps - oldValue) steps")
      }
    }
  }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
//About to set totalSteps to 200
//Added 200 steps
stepCounter.totalSteps = 360
//About to set totalSteps to 360
//Added 160 steps
stepCounter.totalSteps = 896
//About to set totalSteps to 896
//Added 536 steps
```


## Global and Local Variables

The capabilities described above for computing and observing properties are also available to global variables and local variables. Global variables are variables that are defined outside of any function, method, closure, or type context. Local variables are variables that are defined within a function, method, or closure context.

## Type Properties

Instance properties are properties that belong to an instance of a particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.

You can also define properties that belong to the type itself, not to any one instance of that type. There will only ever be one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called type properties.

Type properties are useful for defining values that are universal to all instances of a particular type, such as a constant property that all instances can use (like a static constant in C), or a variable property that stores a value that is global to all instances of that type (like a static variable in C).

Stored type properties can be variables or constants. Computed type properties are always declared as variable properties, in the same way as computed instance properties.

> __NOTE__
> Unlike stored instance properties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.

> Stored type properties are lazily initialized on their first access. They are guaranteed to be initialized only once, even when accessed by multiple threads simultaneously, and they do not need to be marked with the `lazy` modifier.
> 

### Type Property Syntax

```Swift
struct SomeStructure {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 1
  }
}
enum SomeEnumeration {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 6
  }
}
class SomeClass {
  static var storedTypeProperty = "Some value."
  static var computedTypeProperty: Int {
    return 27
  }
  class var overrideableComputedTypeProperty: Int {
    return 107
  }
}
```

>__NOTE__
>The computed type property examples above are for read-only computed type properties, but you can also define read-write computed type properties with the same syntax as for computed instance properties.
>

### Querying and Setting Type Properties

```Swift
print(SomeStructure.storedTypeProperty)
// Prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)
// Prints "Another value."
print(SomeEnumeration.computedTypeProperty)
// Prints "6"
print(SomeClass.computedTypeProperty)
// Prints "27"
```

```Swift
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
// Prints "7"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "7"

rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
// Prints "10"
print(AudioChannel.maxInputLevelForAllChannels)
// Prints "10"

```




















