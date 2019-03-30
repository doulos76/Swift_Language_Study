# Closures

_Closures_ are self-contained blocks of functionality that cna be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

Closures can capture and store references to any constants and variables from the context in which thaey are defined. This is known as _closing over_ those containts and variables. Swift handles all of the memory management of capturing for you.

## Closure Expression Syntax

```Swift
{ (parameters) -> returnType in 
	statements
}
```

