//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 数组 Array
// 创建一个数组
var someInts = [Int]()
someInts.count

someInts.append(3)

someInts = []

// 用一个默认值创建一个数组
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
// 把两个数组拼成一个数组
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

var shoppingList: [String] = ["Milk", "Eggs"]

// 取数组元素或者修改
// 1.取数组元素个数
shoppingList.count
// 2.判断数组是否为空
shoppingList.isEmpty ? (print("The shopping list is empty")) : (print("The shopping list is not empty"))
// 3.添加一个元素
shoppingList.append("Flour")
// 4.添加一个数组或者更多元素用+=
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheeese", "Butter"]
shoppingList.count
// 5.取值
var firstItem = shoppingList[0]
// 6.通过下标进行修改
shoppingList[0] = "Six eggs"
shoppingList
// 7.修改一个区间段的元素
shoppingList[0...3] = ["Bananas", "Apples"]
shoppingList
// 8.插入某个元素
shoppingList.insert("Maple Syrup", atIndex: 0)
// 9.一处某个位置的元素
shoppingList.removeAtIndex(1) // removeAtIndex方法返回是一个元素
shoppingList
firstItem = shoppingList[0]
// 10.删除最后一个元素  use the removeLast() method rather than the removeAtIndex(_:)
shoppingList.removeLast()
shoppingList
// 11.遍历数组中的元素
for item in shoppingList{
    item
}

// 也可以用遍历元素位置的方法 The enumerate() method returns a tuple 返回一个元组
for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1) : \(value)")
}

// Sets 集合 是无序的
// 1.set 类型的元素都是可哈希的 set类型的语法不像数组可以简写
// 2.创建和初始化一个空集合
var letters = Set<Character>()
letters.count
letters.insert("a")
letters = []
// 3.通过数组来创建集合
var favoriterGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// 4.由于仅仅通过字面数组是难以推断出set类型的 因此Set类型需要明显的写出来，但是通过Swift的类型推断是能够推断出是一个什么类型的Set
var favouriterGenres2 : Set = ["Rock", "Classical", "Hip hop"] // 可以推断出是Set<String>类型
// 5.取值和修改元素
if favoriterGenres.isEmpty {
    print("hehe")
} else {
    print("haha")
}
// 6.添加元素
favoriterGenres.insert("Jazz")
// 7.移除元素 返回一个可选值
if let removeGenre = favoriterGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// 8.判断是否包含某个元素
if favoriterGenres.contains("Funk") {
    print("包含")
} else {
    print("不包含")
}
// 9.遍历集合
for genre in favoriterGenres {
    genre
}
// 10.Swift的Set类型因为是无序的，因此如果想按照一个明确的顺序遍历集合中的元素 用sort()方法，该方法会返回一个有序的集合并且提供一个顺序
for genre in favoriterGenres.sort() {
    genre
}
// 11.执行集合运算
// 你可以很有效的只能高兴基本的集合运算，比如将两个集合连接起来就是求他们的并集，这两个集合有什么共同的元素就是求他们的交集，判断两个集合是否完全包含等等
// （1）使用intersect(_:)方法来创建一个集合作为a集合和b集合的交集
// （2）使用exclusiveOr(_:)方法来创建一个集合作为a集合和b集合的交集的补集
// （3）使用union(_:)方法来创建一个集合作为a集合和b集合的并集
// （4）使用subtract(_:)
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
oddDigits.union(evenDigits).sort() // 求并集
oddDigits.intersect(evenDigits).sort() // 求交集
oddDigits.subtract(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()

// （1）使用“==”来判断两个集合是否相同
// （2）使用isSubsetOf(_:)方法来判断一个集合是否是另外一个集合的子集
// （3）使用isSupersetOf(_:)方法判断一个集合是否是另外一个集合的父集
// （4）使用isStrictSubsetOf(_:)或者isStrictSupersetOf(_:)方法来判断是真子集还是真父集
// （5）使用isDisjointWith(_:)方法来判断两个集合是否有交集
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐓", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)
houseAnimals.isStrictSubsetOf(farmAnimals)


// 字典 Dictionaries
// 字典存储的是keys相同类型 values相同类型的无序集合，每个value会有一个唯一的key
// 完整的表示方法 Dictionary<Key, Value>
// 1.初始化一个空字典
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]
// 2.初始化字典
var airports: [String: String] = ["YYZ": "Toronto Person", "DUB": "Dublin"]
// 3.取值和修改字典
// 个数
airports.count
// 判断是否为空
if airports.isEmpty {
    print("空的")
} else {
    print("不是空的")
}
// 4.添加元素
airports["LHR"] = "London"
airports
airports["LHR"] = "London Heathrow"
airports
// updateValue(_:foeKey:)返回一个可选的值 可用来更新某个键对应的值 返回的是旧值
//airports.updateValue("Dubin Airport", forKey: "DUB")
airports
if let oldValue = airports.updateValue("Dubin Airport", forKey: "DUB") {
    print("The old value is \(oldValue)")
}
// 用下标取值，返回的是一个可选值，因为可能没值
if let airportName = airports["DUB"] {
    print("The name of airport is \(airportName).")
} else {
    print("找不到对应的值")
}
// 你可以将某个键的值设为nil来删除该项
airports["APL"] = "Apple International"
airports
airports["APL"] = nil
airports
// 或者也可以使用removeValueForKey(_:)来进行该操作 返回值如果存在是被移除的值 如果不存在返回nil
if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("不存在该值")
}
airports

// 遍历字典中的元素 通过for-in循环返回（key, value）的元组，存储在临时常量或者变量之中
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// 得到所有的键
for airportCode in airports.keys {
    airportCode
}
// 得到所有的值
for airportName in airports.values {
    airportName
}

// 如果你需要一个数组来接收所有的键或者所有的值 可以用一下方法
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

// 由于字典的存储是无序的所以如果要按照一定的顺序进行存储 可以使用sort()方法
for airportCode in airports.keys.sort() {
    airportCode
}



































