
//: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 2.0
print("Tandem: \(tandem.description)")


// Overriding
// 1.重载方法 可以在子类里边通过调用父类的方法super.someMethod()
// 2.重载属性 可以在子类里边通过super.someProperty进行访问
// 3.重载下标 可以在子类里边通过super[someIndex]进行访问

// Overriding Method
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

// Overriding Properties  Overriding Property Getters and Setters
// 你可以在子类中重载一个可读属性，通过提供getter和setter方法在子类中成为可读可写属性，但是不能反过来
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// Overring Property Observers
// 常量的存储属性和只读的计算属性不能添加属性观察继承。因为这些值不能改变，同时也不适用于willSet和didSet使用
// 同时还要注意同时为一个属性既提供重载setter又提供重载属性观察。如果你想观察属性值的改变并且已经为那个属性提供了自定义的setter方法，你只需要在这个自定义的setter方法中观察值的改变就可以了
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
// 无论何时给currentSpeed设一个值，该属性的didSet观察就会根据currentSpeed这个属性设置gear的值
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("Automatic: \(automatic.description)")

// Preventing Overrides
// 用final关键字可以避免重载 对于方法Methods,属性property,下标subscript使用 final var,final func, final class func, final subscript


// 初始化 Initialization
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")


struct Celsius {
    var tempertureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        tempertureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        tempertureInCelsius = kelvin - 273.15
    }
    
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.tempertureInCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.tempertureInCelsius


// Local and External Paramenter Names
struct Color {
    let red, green, blue: Double
    let alpha: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = 1.0
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
        alpha = 1.0
    }
    
    init(red: Double, green: Double, blue: Double, _ alpha: Double) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = 1.0
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
let colorWithAlpha = Color(red: 1.0, green: 1.0, blue: 1.0, 0.5)

// 如果你初始化参数不需要External Names 可以用下划线代替(_) 如上例进行了扩展后添加alpha参数后的效果 还有一点要注意 初始化的时候所有的成员变量都要进行初始化
// 可选类型(optional)属性会自动初始化为nil 表明属性在初始化期间不一定有值
class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."


// 结构体类型的成员化初始化
struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    
    var size = Size()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basecRect = Rect()
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
// class有继承 结构体和枚举没有继承
// 类的class所有存储属性包括从父类集成的任何属性都应该进行初始化 swift为类的存储属性提供了两种构造器designated initializers 和 convenience initializers
/* 语法designated initializers
init (parameters) {
    statements
}

convenience initializers
convenience init (parameters) {
    statements
}
*/

// Initializer Delegation for Class Types 为了说明designated initializers 和 convenience initializers两者之间的关系 Swift采用下面三条规则
// 1.A designated initializer must call a designated initializer from its immediate superclass
// 2.A convenience initializer must call another initializer from the same class
// 3.A convenience initializer must ultimately call a designated initializer
// 一个简单的记忆方式（1）Designed initializers must always delegate up (2) Convenience initializers must always delegate across


// Default Initializers
class Vehicle2 {
    var numberOfWheels = 0
    
    var description: String {
        return "\(numberOfWheels) wheels"
    }
}

class Bicycle2: Vehicle2 {
    override  init () {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle2 = Bicycle2()
print("Bicycle: \(bicycle2.description) ")


class Food {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
 let mysterMeat = Food()
class RecipeIngredient: Food {
    
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

// 下面三种方式均可以创建RecipeIngredient实例
let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)


class ShoppingListItem: RecipeIngredient {
    
    var purchased = false
    
    var description: String {
        var output = "\(quantity) X \(name)"
        output += purchased ? " √" : " ×"
        return output
    }
}

var breakfastList = [

    ShoppingListItem(),
    
    ShoppingListItem(name: "Bacon"),
    
    ShoppingListItem(name: "Eggs", quantity: 6)
]

breakfastList[0].name = "Orange juice"
breakfastList[1].purchased = true
for item in breakfastList {
    print(item.description)
}


// Failable Initializers 初始化可能失败 为了避免这个问题可以在init后边添加上一个？即init?
struct Animal {
    
    let species: String
    
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}


// Failable Initializers for Enumerations
enum TemperatureUnit {
    
    case Kelvin, Celsius, Fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
    
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization successed.")
}

let unknowUnit = TemperatureUnit(symbol: "X")
if unknowUnit == nil {
    print("This is not a defined temperature unit, so initialization failed")
}


// Failable Initializers for Enumerations with Raw Values
// Enumerations的Raw Values会自动接收一个Failable Initializers, init?(rawValue:)

enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}

let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
if fahrenheitUnit2 != nil {
    print("This is a defined temperature unit, so initialization succeed.")
}

let unknowUnit2 = TemperatureUnit2(rawValue: "X")
if unknowUnit2 == nil {
    print("This is not a defined temperature unit, so initialization failed")
}


// Failable Initializers for Classes
class Product2 {
    
    let name: String!
    
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}

// Product2类定义了一个不能是空字符串的常量name 为了满足这种强制需求，Product2类使用了failable initiablizer来保证在成功初始化之前属性的值不为空。然而Product2是一个类 而不是structure。这就意味着在初始化失败之前要提供属性name的初始值
if let bowTie = Product2(name: "bow tie") {
    print("The product's name is \(bowTie.name)")
}



// Propagation of Initialization Failure 类、结构体、枚举的可失败初始化可以传递给该类的另外一个可失败初始化。类似地，子类的可失败初始化可以delegate up父类的可失败初始化.
// 注：一个可失败初始化可以delegate to一个不可失败初始化
































