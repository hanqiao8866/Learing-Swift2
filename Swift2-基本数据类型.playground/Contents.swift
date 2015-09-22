//: Playground - noun: a place where people can play

// Swift2 -- 基本数据类型
import UIKit

var str = "Hello, playground"

let minValue = UInt8.min
let maxValue = UInt8.max


let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine


let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("no value")
}

// 异常处理
// 当函数运行一个错误的的条件的时候，他可以抛出异常
func canThrowAnError() throws {
    
}

do {
    
    try canThrowAnError()
    
} catch {

}


func eatASandwich() {

}

func makeASandwich() throws {
    // ...
}

do {
    
    try makeASandwich()
    eatASandwich()
    
} catch {

}


// 断言 Assertions
let age = -3
//assert(age > 0, "A person's age cannot be less than zero")


let dogString = "Dog!!🐶"
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", appendNewLine: false)
}

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", appendNewLine: false)
}

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", appendNewLine: false);
}

for scalar in dogString.unicodeScalars {
    print("\(scalar)");
}


















