//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Swift的取余运算符也适用于float类型

8 % 2.5

var a = 0
let b = ++a
a


// Nil合并运算符
// nil合并运算符（a ?? b）为可选类型a解包（如果a有值的话），如果a为nil则返回b，表达式中的a是一个可选类型   a != nil ? a! : b  这个三目运算符在a有值的情况下将a强制解包，如果没值的话就返回b
let defaultColorName = "red"
//var userDefinedColorName: String?
var userDefinedColorName = "green"
var colorNameToUse = userDefinedColorName ?? defaultColorName


let names = ["Anna", "Alex", "Brian", "Jack"]
for i in 0 ..< names.count {
    print("Person \(i + 1) is called \(names[i])")
}


// 初始化空字符串
var emptyString = ""
var anotherEmptyString = String()
// 判断一个字符串是否为空
if emptyString.isEmpty {
    print("空的字符串")
}

// 遍历字符串
for character in "Dog!🐶".characters {
    print(character)
}

// String可以通过一个字符数组来创建
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
catString

// 如果不是字符数组 就会出现这样的情况
let catCharacters2: [String] = ["Caaa", "a", "tww", "!", "🐱"]
let catString2 = String(catCharacters2)
catString2


// 字符串拼接包括和字符拼接
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)


// 转义字符的处理
// 双引号  Extended grapheme clusters
let wiseWords = "\"Imagination is more important than knowledge\" - Enistein"
wiseWords
let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F495}"
let combinedAcute = "\u{65}\u{301}"
let decomposed = "\u{1112}\u{1161}\u{11AB}"

// 计算字符串的字符个数
let message = "hdhdkhak"
message.characters.count


// 这种情况要注意
var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
word += "\u{301}"
print("the number of characters in \(word) is \(word.characters.count)")

// 字符串的访问  predecessor()前一个  successor()后一个
let greeting = "Guten Tag!"
greeting.startIndex
greeting[greeting.startIndex]
greeting.endIndex
greeting.endIndex.predecessor()
greeting[greeting.endIndex.predecessor()]
greeting.startIndex.successor()
greeting[greeting.startIndex.successor()]
let index = advance(greeting.startIndex, 7)
greeting[index.successor()]

for index in greeting.characters.indices {
    print("\(greeting[index])", appendNewline:true)
}

// 字符串插入和移除
var testString = "hello"
// 在字符串某个地方添加字符
testString.insert("!", atIndex: testString.endIndex)
// 在字符串某个地方添加字符串
testString.splice(" there".characters, atIndex: testString.endIndex.predecessor())
// 删除某个字符
testString.removeAtIndex(testString.endIndex.predecessor())
testString
// 删除某个区间上的字符串
let range = advance(testString.endIndex, -6)



























