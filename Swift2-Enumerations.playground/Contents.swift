//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 枚举语法
enum CompassPoint {
    case North
    case South
    case East
    case West
}

// 注：跟C和OC不同的是 Swift的枚举成员不会默认的给他们有一个赋值

// 多成员可以写成一行
enum Planet: String {
    case Mercury, Vanus, Earth, Mars
}

var directionToHead = CompassPoint.East
directionToHead = .West

// 和switch语句一块儿使用
directionToHead = .South
switch directionToHead {
case .North:
    print("borth")
case .South:
    print("south")
case .East:
    print("east")
case .West:
    print("west")
}
// switch语句要遍历所有的项 如果列举的内容很多 可以使用default来涵盖所有的项

enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 2)
productBarcode = .QRCode("dhakdakjjlad")
switch productBarcode {
case let .UPCA(numberSystem, manufaturer, product, check):
    print("UPC-A: \(numberSystem), \(manufaturer), \(product), \(check)")
case let .QRCode(productCode):
    print("QRCode: \(productCode)")
}

// Raw Values
enum Directions: String {
    case North, East, West, South
}
let direction = Directions.West.rawValue
// rawValue 只适用于 String类型
let earthOrder = Planet.Earth.rawValue

//Directions(rawValue:3)

// 递归枚举  indirect也可以写在enum之前 使得整个枚举成员都遵从
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

// 一个递归函数
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

// 计算 （5 + 4） * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))




































