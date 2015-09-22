//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 闭包
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
names.sort()
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

// 闭包的写法
//{ (parameters) -> return type in
//    statements
//}
// 闭包的语法可以使用常量参数，变量参数，inout参数，不能提供默认值，如果要使用Variadic parameters但是要放在所有参数的最后，元组也可以作为参数和返回值
// 上边的函数闭包的写法如下
reversed = names.sort({ (s1: String, s2: String) -> Bool in
    return s1 > s2
})
reversed = names.sort({ s1, s2 in
    return s1 > s2
})
reversed = names.sort({ s1, s2 in s1 > s2 })
reversed = names.sort({ $0 > $1 })
// 这里$0和$1就指的是第一个和第二个参数
// 运算函数
reversed = names.sort(>)


// Trailling Closure
// 如果你需要向一个函数传第一个闭包表达式，并且是函数的最后一个参数，如果这个闭包有点长，可以使用trailing closure . trailing closure 是写在圆括号的后边的
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
    print("hehe")
}

// 这是不使用trailing closure 调用这个函数的方法
someFunctionThatTakesAClosure  ({
    
})

// 如果闭包表达式是函数的唯一参数并且你是用的是trailing closure那么函数名后边的圆括号也是可以省略的
someFunctionThatTakesAClosure {
    
}

someFunctionThatTakesAClosure() {
   
}

reversed = names.sort() {$0 > $1} // 用trailing closure的写法

// trailing closure在当闭包内容很长无法一行写完的情况下使用会非常有用 例如Array类型中的map(_:)方法
let digitNames = [0: "Zero", 1: "One", 3: "Three", 4: "Four", 5: "Five", 6: "Six",
    7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
    (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

let strings2 = numbers.map { (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

func makeIncrementer(forIncrement amount: Int) -> Void -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// 该函数的返回值是一个函数 Void -> Int  是copy 而不是assign
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()































