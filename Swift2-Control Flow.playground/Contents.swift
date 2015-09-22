//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//while condition {
//    statements
//}
//
//repeat {
//    statements
//} while condition

// case语句
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1) is outside of the box)")
}

// 值绑定
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x).")
case (0, let y):
    print("on the y-axis with a y value of \(y).")
case (let x, let y):
    print("somewhere else at (\(x), \(y))")
}

// where语法 A switch case can use a where clause to check for additional conditions
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y) is just some arbitrary point)")
}

// Control Transfer Statements  Swift has five control transfer statements
// continue, break, fallthrough, return, throw

// continue
let puzzleInput = "great minds thank alike"
var puzzleOutPut = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutPut.append(character)
    }
}
print(puzzleOutPut)

// break
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "一":
    possibleIntegerValue = 1
case "2", "二":
    possibleIntegerValue = 2
case "3", "三":
    possibleIntegerValue = 3
case "4", "四":
    possibleIntegerValue = 4
default:
    break
}
if let intergerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(intergerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

// fallthrough
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is "
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += "a prime number, and also "
    fallthrough
default:
    description += "an integer"
}
print(description)

// 由于在循环嵌套等复杂的流程控制语句中，都可能用到多个break或者continue等 那么为了区分他们 Swift语句引入了Labeled Statement 这样可以来区分是哪个 防止混乱分不清楚


// Early Exit
// guard语句，必须有else
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location)!")
}

//greet(["name": "John"])
greet(["name": "Jane", "location": "Cupertino"])


// Checking API Availability
// Swift可以支持API是否提供的检查，这样可以防止你调用API未提供的方法，如果你使用了API未提供的方法，编译就会出错 *是必须的
if #available(iOS 9, OSX 10.10, *) {
    // Use iOS9 APIs on iOS, and use OS X v10.10 APIs on OS X
} else {
    // Fall back to earlier iOS and OS X APIs
}
































