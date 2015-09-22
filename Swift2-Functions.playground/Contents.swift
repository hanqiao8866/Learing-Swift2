//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func sayHello(person: String) -> String {
    return "Hello, " + person
}

func sayHelloAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}
sayHelloAgain("Li Lei")


// 函数参数和返回值
// 1.没有参数 即使没有参数 函数名后边的圆括号也不能省去 在调用该函数的时候也要带上圆括号
func sayHelloWorld() -> String {
    return "Hello World!"
}
sayHelloWorld()

// 2.多参数 用逗号隔开
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    } else {
        return sayHello(personName)
    }
}
sayHello("Tim", alreadyGreeted: true)

// 3.无返回值
func sayGoodbye(person: String) {
    print("Goodbye, \(person)")
}
sayGoodbye("Dave")
// 注：其实严格意义上说sayGoodbye(_:)函数仍然有返回值，返回的类型是Void,这是一个简单的空元组，元组里有0个元素，可以写作（）

// 函数的返回值可以忽略
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}
printAndCount("Hello World!")
printWithoutCounting("Hello World!")

// 4.多返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[0..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.0) and max is \(bounds.1)")
print("min is \(bounds.min) and max is \(bounds.max)")
// 元组的成员在作为函数的返回值的时候，不用重新命名，因为他们的名字在函数的返回值中已经明确了

// 5.可选元组作为返回值
// 如果作为函数返回值的元组与可能no value 你可以使用可选元组来表明可能是空的情况，只需要在返回值的元组后面加上一个？即可 例如(Int, Int)? or (String, Int, Bool)?
// 如上边的minMax(_:)函数对传过去的数组没有进行任何检查，如果传过去一个空数组，那么array[0]就会报运行时错误
//let bounds2 = minMax([])
func minMaxModify(array:[Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {return nil}
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[0..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//let bounds3 = minMaxModify([])
// 你可以使用可选绑定来检查返回值是否为nil
if let bound4 = minMaxModify([8, -5, 9, 10]) {
    print("min is \(bound4.min) and max is \(bound4.max)")
}


// 5.函数参数名
// 添加外部参数可以使代码更具可读性
func sayHelloNew(to person: String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)!"
}
sayHelloNew(to: "Bill", and: "Ted")

// 有时候我们不需要显示参数名，这时候可以用一个下划线（_）来表示
func someFunction(firstParamentName: Int, _ : Int) {
        print("haha")
}
someFunction(1, 2)
// 你可以给参数设置初始值
func anotherFunction(firstParmentNameWithDefault: Int = 12) {
    print("\(firstParmentNameWithDefault)")
}
//anotherFunction()
anotherFunction(14)


// 6.多参数类型，一般把多参数的放在所有参数的最后面
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total/Double(numbers.count)
}
arithmeticMean(1,2,3,4,5,6,7,8,9,10)
arithmeticMean(3, 8.25, 18.75)

// 7.可变参数 函数参数默认情况下都是不可变的
func alignRight(var string: String, totalLength: Int, pad:Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddingString = alignRight(originalString, totalLength: 10, pad: "-")


// In-Out参数
// 可变参数如上个例子只能在函数内部修改 如果你想在函数调用后，你更改的参数仍然继续可以使用，那么就将参数定义为 in-out参数  使用关键字inout
// in-out参数有这样的特性：可以以一个值传入函数，在函数里边被修改，然后将修改后的值再进行输出 in-out参数必须是可变类型（用var修饰） 你可以直接在参数前边放一个（&），来表明该参数是可以被函数进行修改的
// 注意in-out参数不能有默认值，多参数（Double...）不能被标记为in-out参数,如果将一个参数用inout修饰，那就不能再用var和let来修饰
// 下面函数是交换两个整数，他的两个参数都被inout修饰
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
// 用两个变量作为函数的参数传递过去 这两个参数前边要加上(&)
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// 结果显示两个原始值在经过swapTwoInts(_:_:)调用之后 均被修改了


// 8.使用函数类型
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
// 定义一个变量mathFunction 类型是，带两个整型参数返回一个整型 的类型 （类似于 var aString: String = "hehe"）设置这个变量是addTwoInts(_:_:)函数

var aString: String = "hehe"

mathFunction(5, 6)
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTwoInts // 修改变量 现在指向multiplyTwoInts函数
mathFunction(5, 6)



// 函数类型作为参数类型传递  你可以使用函数类型比如(Int, Int) -> Int 作为一种另一个函数的参数类型
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 5, 8)
printMathResult(multiplyTwoInts, 5, 8)
// 这个函数叫printMathResult(_:_:_:),它有三个参数，第一个参数是mathFunction,类型是(Int, Int)->Int,第二个和第三个参数是a和b，类型是Int


// 函数类型作为返回值 你可以用一个函数类型作为另外一个函数的返回值
func stepForward(input: Int) -> Int {
    return input + 1
}

func stepBackward(input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = -10
let moveNearerZero = chooseStepFunction(currentValue > 0)
// 现在moveNearerZero指向函数stepBackwards(_:)
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerZero(currentValue)
}
print("zero!")



// 函数嵌套 Nested Functions  上边所有的函数都是全局函数 在函数里边嵌套的函数是局部函数






















