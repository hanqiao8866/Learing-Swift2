//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

someVideoMode.resolution.width = 1280
print("The width os someVideoMode is \(someVideoMode.resolution.width)")

// 所有的结构体都有一个默认的成员初始化方法
let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")


// 类是值引用 结构体是copy
// 所以为了判断类的实例是否指向同一个 Swift引入了两个识别操作符 相等=== 不相等!==
let tenEight = VideoMode()
tenEight.resolution = hd
tenEight.interlaced = true
tenEight.name = "1080i"
tenEight.frameRate = 25.0

let alsoTenEight = tenEight
alsoTenEight.frameRate = 30.0
print("The frameRate property of tenEight is now \(tenEight.frameRate)")

if tenEight === alsoTenEight {
    print("tenEighty and alseoTenEighty refer to the same VideoMode instance")
}
// A === B 不是指A和B相等（相等是A==B）而是指的是A和B指向同一个类的实例


// Properties   计算属性一般通过类、结构体、枚举提供    存储属性通过类、结构体提供
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//rangeOfFourItems.firstValue = 6
// 如果初始化一个常量  那么即使属性是可变的也不能修改  修改就会报错  而类不存在这种情况

// 懒存储属性 Lazy Stored Properties 直到第一次使用的时候才加载初始化值 用lazy来修饰 懒存储属性只适用于变量这是因为变量可能在直到实例初始化完成后也获取不到值 而常量通常在实例初始化还未完成之前就已经获取到值了

// 下面这个例子用到了懒存储属性来避免复杂类还未初始化完成的情况
class DataImporter {
    // 这是一个从外部文件导入数据的一个类 假设这个类需要一定的时间进行初始化
    var fileName = "data.txt"
    // 下边可以写一些方法
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 下边可以写一些方法
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter的实例importer还未创造
print(manager.importer.fileName)


// 计算属性 类、结构体、枚举可以定义计算属性，这不是真正意义上的存储值，他们提供getter和可选的setter去直接获取或者设置其他属性和值
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
        
        // 如果计算属性的setter方法没有为新的变量定义名字，那么可以使用newValue
        // set {
        //    origin.x = newValue.x - (size.width / 2)
        //    origin.y = newValue.y - (size.height / 2)
        // }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


// 只读计算属性（Read-Only Computed Properties）计算属性如果没有setter方法只有getter方法就是只读计算属性 只读计算属性有返回值能用点语法取到，但是不能重新赋值
// 声明一个只读计算属性只需要移除get关键字和大括号即可
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

// Property Observers
// willSet is called just before the value is stored
// didSet is called immediately after the new value is stored
class StepCounter {
    var totalStep: Int = 0 {
        willSet(newTotalStep) {
            print("About to set totalSteps to \(newTotalStep)")
        }
        
        didSet {
            if totalStep > oldValue {
                print("Add \(totalStep - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalStep = 200
stepCounter.totalStep = 360
stepCounter.totalStep = 896


// 全局和局部变量 Global and Local Variables
// Type Properties
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
// 在每种类型的范围内定义类型属性使用static关键字 对于在class类型中的计算类型属性，你可以使用class关键字代替 这样可以使得子类可以重载父类的实现 上边的例子就是这样使用的
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypeProperty)
print(SomeClass.overrideableComputedTypeProperty)


struct AudioChannel {
    static let thresholLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholLevel {
                currentLevel = AudioChannel.thresholLevel
            }
            
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)


// Methods方法
// Instance Methods
class Counter {
    var count = 0
    // 加1
    func increment() {
        ++count
    }
    // 加某个值amount
    func incrementBy(amount: Int) {
        count += amount
    }
    // 重置为0
    func reset() {
        count = 0
    }
    
    func incrementByTimes(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}
let counter = Counter()
counter.increment()
counter.incrementBy(5)
counter.reset()
counter.incrementByTimes(5, numberOfTimes: 3)


struct PointPoint {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
    // 没有self前缀的话，Swift将会推断x都是参数里边的x
}

let somePoint = PointPoint(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// Modifying Value Types from Within Instances Methods
// Structures和Enumerations是value types.默认情况下 value type的属性是不能够在实例方法内修改的，但是如果你需要在某个方法中进行修改的话，那么该方法的属性可以用mutating来进行修饰。每次在该方法结束的时候，修改原来的值
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    mutating func moveByXWithSelf(deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(2.0, y: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")


// Assigning to self Within a Mutating Method
var somePoint3 = Point2(x: 1.0, y: 1.0)
somePoint3.moveByXWithSelf(2.0, y: 3.0)
print("The point now is at (\(somePoint3.x), \(somePoint3.y))")

// 枚举的可变方法可以改变self参数为不同的值
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
print(ovenLight)
ovenLight.next()
print(ovenLight)


// Type Methods 类方法
struct LevelTracker {
    static var highestUnlockedLevel = 1
    
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
 
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init (name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.completedLevel(1)
print("highest unlock level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advanceToLevel(6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}


// Subscripts
// Classes,structures,and enumerations can define subscripts 下表语法(用subscript作为关键字)可以使得通过中括号进行取值 分为可读可写read-write和只读read-only两种 read-write有get和set方法 read-only只有get方法（get可以省略）
/*
subscript(index: Int) -> Int {
    get {
        // return an appropritate subscript value here
    }
    
    set(newValue) {
        // perform a suitable setting action here
    }
}
*/
/*
subscript(index: Int) -> Int {

    // return an appropritate subscript value here

}
*/

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


// Subscripts Usage 下标的使用
var numberOfLegs = ["Spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"]
// Swift中字典类型Dictionary使用的是下标语法 但是在取值的时候并不是一定存在值 返回的是一个可选类型的
// Subscript Optional 下表语法可以使用多个参数
struct Matrix {
    let rows: Int, columns: Int
    
    var grid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
    
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
matrix

let someValue = matrix[2, 2]










































