//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello World")

let label = "The width is "
let width = 94
let widthlabel = label + String(width)

var shoppingList = ["catfish","water","tulips"]
shoppingList[0]

shoppingList[1] = "biscuit"
shoppingList

var occupation = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic"
]

occupation["Janey"] = "Public Relations"
occupation

occupation["Malcolm"] = "Heny"
occupation

// init empty array and dictionay
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

shoppingList = []
occupation = [:]


// control flow
let individulScore = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individulScore {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
teamScore

var optionString: String? = "Hello"
print(optionString == nil)

var optionName: String? = "John"
var greeting = "Hello!"
if let name = optionName {
    greeting = "Hello, \(name)"
}


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log")
case "cucumber","watermellon":
    print("That would make a good tea sandsich")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup")
}

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var firstLoop = 0
for i in 0..<4 {
    firstLoop += 1
}
firstLoop

var secondLoop = 0
for var i = 0; i < 4; ++i {
    secondLoop += 1
}
secondLoop


// Functions and Closures
func greeting(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greeting("Mary", day: "Wedsenday")

func calucateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min, max, sum)
}

let statistics = calucateStatistics([5, 3, 100, 3, 9])
print(statistics.min)
// 可以通过点语法取得返回值的某个值 注意不要越界
print(statistics.2)
print(statistics.sum)

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf(43,67,100)

func avarge(numbers: Float...) -> Float {
    var avargeNumber: Float = 0.0
    for number in numbers {
        avargeNumber += number
    }
    avargeNumber /= 3.0
    return avargeNumber
}
avarge(1.1,2.2,3.3)

// nested function
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 函数作为返回值
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
let increment = makeIncrementer()
increment(17)

// 函数作为参数
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 10, 7, 17]
hasAnyMatches(numbers, condition: lessThanTen)


var hehe = [1, 3, 5, 7]
// Closures
hehe.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
let mappedNumber = hehe.map({ number in 3 * number })
print(mappedNumber)

let sortedNumbers = hehe.sort { $0 > $1 }
print(sortedNumbers)


// Objects and Classes
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
shape.simpleDescription()

class NameShape {
    var numberOfSides: Int = 0
    var name: String;
    
    init (name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// 继承
class Square: NameShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()


class EquilateralTriangle: NameShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "A equialateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            suqare.sideLength = newValue.sideLength
        }
    }
    
    var suqare: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        suqare = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
        
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another teet shape")
print(triangleAndSquare.suqare.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.suqare = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


// Enumerations and Structures
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> NSString {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
if let convertedRank = Rank(rawValue: 7) {
    let fiveDescrition = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescriptions = hearts.simpleDescription()


struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()




enum ServerResponse {
    case Result(String, String)
    case Error(String)
}
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let error = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}



// Protocols and Extensions  类、枚举和结构体都可以使用协议
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)


// Generic 泛型
// 将名字写在<>中创建一个泛型函数或者类型
func repeatItem<Item>(item: Item, numberOFTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0 ..< numberOFTimes {
        result.append(item)
    }
    return result
}

repeatItem("knock", numberOFTimes: 4)

// 类、枚举、结构体也可以使用泛型
enum OptionalValue<T> {
    case None
    case Some(T)
}

var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)


func anyCommonElements <T, U where T: SequenceType, U:SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs:T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}

anyCommonElements([1, 2, 3], [3])





































