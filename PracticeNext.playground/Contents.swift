//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
class AppUtils{
    var label:String = String()
    var width:Int = Int()
    var concatenate:String = String()
    //static func cannot be override can be accessed by itself
    static func notOverriden(){
        
        
    }
   func appUtility(){
        label = "stringValue"
        width = 78
        var shoppingList = ["egg","rice","meat","cereals","onions"]
        shoppingList[0] = "raddish"
        print("Replaced:\(shoppingList)")
    }
}

class AppOtherUtils: AppUtils {
    var i:Int = Int()
    override func appUtility() {
       // let emptyArray = [String]()
       // let emptyDict = [String:Any]
        var occupation = ["sita":"Teacher","rama":"doctor","Sonu":"bussinessman"]
        occupation["Janet"] = "Public Relation"
        label = "Damacaus"
        width = 50
        concatenate = label + String(width)
        print("concatenate\(concatenate)")
        let score = [50,60,70,40,30]
        var overallScore = 0
        for teamScore in score{
            if teamScore > 50{
                overallScore += 10
            }
            else
            {
                overallScore += 5
            }
        }
       print(overallScore)
    }
    
    func withReturnValue(person:String, on day:String) ->  String
    {
        return"Hello\(person),today is\(day)"
    }
    
    func noargument(_ check:String, value:Int) -> Int
    {
        return value * 7
        
    }
//Use tuple to make multiple compound value.for example to return multiple values form a function
  func calculate(score:[Int])->(min:Int,max:Int,sum:Int){
var max = score[0]
    print("max:\(max)")
var min = score[0]
    print("min:\(min)")
var sum = 0
for scores in score{
    print(scores)
if scores > max{
    
max = scores
     print("max:\(max)")
}
else if scores < min{
min = scores
    print("min:\(min)")
}
    
     sum += scores
}
   
    return (min,max,sum)
}
    //nested functions -> have access to variables that were declared in the outer function
    func nestedFunc()-> Int{
        var y = 10
        func add(){
            
            y += 5
        }
        add()
        return y
    }
}

var appOtherUtils = AppOtherUtils()
appOtherUtils.appUtility()
appOtherUtils.withReturnValue(person: "Raj", on: "Saturday")
appOtherUtils.noargument("empty" ,value: 9)
let statistics = appOtherUtils.calculate(score: [10,20,30,40,50])
statistics.sum
appOtherUtils.nestedFunc()




var optionalString:String? = "Value Added"
optionalString = nil
print("optional string\(optionalString)")
optionalString = "add value"
//optional value is wrapped and assigned to let
if let optionalStr = optionalString
{
    print("after conditional wrapping:\(optionalStr)")
}

//if optional value is missing default value is used
var anotherWay:String = "default value"
var anotherValue:String? = nil
var vlaue = anotherValue ?? anotherWay

//switch
var vegetable = "cauli flower"
switch vegetable {
case "carrot":
    print("good for health")
case "beetRoot":
    print("rich in iron")
case let x where x.hasPrefix("cauli"):
    print("Is it a spicy\(x)?")
default:
    print("healthy vegetables.")
}

//a function can return another function as its  value
func makeIncrement() -> ( (Int) -> Int){
    func addOne(number:Int) -> Int
    {
        return 1 + number
    }
    return addOne
}

var increment = makeIncrement()
increment(7)

//a function can take another function as one of its argument
func hasAnyMatches(list:[Int], condition:(Int) -> Bool) -> Bool{
    for item in list
    {
        if condition(item){
            return true
        }
       
    }
    return false
}

func lessThanTen(number:Int) -> Bool{
    return number < 10
}

var numbers1 = [20,30,90,12,100]
hasAnyMatches(list: numbers1, condition:lessThanTen )

//functions are actually special case of closures:block of code
//in is to seperate the argumenrs and return type from the body
numbers1.map ({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers1.map({ number in 3 * number })
print(mappedNumbers)

class Greet{
    var message: String = ""
    
    func greet() -> String{
        return message
    }
    
}

var greetClass = Greet()
greetClass.message = "Say,Hellao"
greetClass.greet()

//with initializer
class GreetInit: Greet{
  
    var  name : String
    init(name: String) {
        self.name = name
    }
    
  override func greet() -> String{
        return message
    }
}

class NamedShape{
    var numberOfSides: Int = 0
    var name: String
    
    init(name:String) {
        self.name = name
    }
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides."
    }
}

NamedShape.init(name: "hello")

class Square: NamedShape{
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double{
        return sideLength  * sideLength
    }
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

class Circle: NamedShape{
    var radius: Double
    
    
    init(radius: Double, name:String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides  = 0
        
    }
    func area() -> Double{
       radius = 3.12 * radius * radius
        return radius
    }
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

let areaCircle = Circle(radius: 5.0, name: "area of circle")
areaCircle.area()
areaCircle.simpleDescription()


class EquilateralTriangle: NamedShape{
    //subclass property
    var sideLength: Double = 0.0
    init(sideLength: double_t, name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double{
        get{
            return 3.0 * sideLength
        }
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An euilateral triangle with sides of length \(sideLength)"
    }
}

 var triangle = EquilateralTriangle(sideLength: 3.0, name: "An equilateral triangle")
print(triangle.perimeter)
triangle.perimeter = 9.0
print(triangle.sideLength)

//Enumeration concept
enum Rank: Int{
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String{
        switch  self {
        case .ace:
            return "ace"
        case .king:
            return "jack"
        case .jack:
            return "queen"
        case .queen:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertRank = Rank(rawValue: 2)
{
    let  threeDescription = convertRank.simpleDescription()

}

protocol ExampleProtocol{
    var simpleDescription:String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol{
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 89
    func adjust() {
        simpleDescription += "Now 100% adjusted"
    }
}

//Error Handling

enum PrinterError: Error{
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String{
    if printerName == "Never Has Toner"{
        throw PrinterError.noToner
    }
    return "job sent"
}

do{
    let printerResponse = try send(job: 1999, toPrinter: "Hhkhhjk")
    print(printerResponse)
}catch{
    print(error)
}

do{
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
}catch PrinterError.onFire{
    print("I'll just put this over here, with the rest of the fire.")
}catch let printerError as PrinterError{
   
}catch{
    print(Error.self)
}

var html: String?
html = "<html><body><p><br/></p><h3>Problem Scenario</h3><p>NRM is validation existing interface on validateEthernetSubInterface<br/><br/>Scenario: Circuit Parameter NCR to add sub interface.<br/><br/>URL with Problem: http://nrm-prod.nrm.nmcc.sprintspectrum.com:8080/common/uobject.jsp?tab=_Activation+Info&amp;object=9141558521613350846<br/><br/>Steps performed:<br/><br/>Created new Circuit Parameter NCR to add sub interface GigabitEthernet0/9/0/0.610 to the NNI on sl-pe17-spr.<br/><br/></p><h3>Diagnostics</h3><p>NRM validates existing sub interfaces on main port GigabitEthernet0/9/0/0 and also configure the descriptions for existing sub interfaces.<br/><br/>Activation scripts fail due to the validation on existing sub interfaces.<br/></p><p>Expected Results: NRM should not validate and reconfigure the descriptions for existing sub interfaces.<br/><br/>Root Cause: Validation of all existing sub-interfaces are done even if no changes are made on existing sub-interfaces during CPC NCR.<br/><br/><br/></p><h3>Resolution Steps</h3><p>WA used by user is: Skip the activation and do it manually(CLI) in the router.<br/></p><p><br/></p>></body></html>"
extension String {
    
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: Data(utf8),
                                          options: [.documentType: NSAttributedString.DocumentType.html,
                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                          documentAttributes: nil)
        } catch {
            print("error: ", error)
            return nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    func trim() -> String
    {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
}

}

//The Mutating Keyword

//doesnot change the width or the height variables
//struct Rectangle{
//  var width = 1
//  var height = 1
//    func area() -> Int{
//        return width * height
//    }
//}

//changes the width and height variables
struct Rectangle{
    var width = 1
    var height = 1
    mutating func scaleBy(value: Int) {
        width *= value
        height *= value
    }
}

var myRect = Rectangle(width: 2, height: 3)
myRect.scaleBy(value: 3)


var numbers = [1, 2, 4, 2, 1, 3, 5, 1, 7]

var numbersSorted = numbers.sorted{
    $0 > $1
    }

var duplicateCount: [Int: Int] = [:]

let counts = numbers.reduce(into: [:]) { counts, number in
    counts[number, default: 0] += 1
}
print(counts)

let letters = "abracadabra"
  let letterCount = letters.reduce(into: [:]) { counts, letter in
         counts[letter, default: 0] += 1
    }
let duplicateSort = counts.sorted{ $0.value < $1.value}

print(duplicateSort)
print(letterCount)

var inputArray = [Int]()
var outputDict = [String:[Int]]()
var resultArray = [Int]()


inputArray = [1, 2, 4, 2, 1, 3, 5, 1, 7]
for i in 0..<inputArray.count {
     sorting(currentElement:inputArray[i])
}
let keys = outputDict.keys.sorted(by: <)
for item in keys {
    if let nonNilItem = outputDict[item] {
        for item1 in nonNilItem {
            resultArray.append(item1)
        }
    }
}
print("The output array is:\(resultArray)")


func sorting(currentElement:Int){
    let currentCount = inputArray.filter({$0 == currentElement}).count
    
    if  outputDict.keys.contains(String(currentCount)) {
        var array = outputDict["\(currentCount)"]
        if !array!.contains(currentElement) {
            array?.append(currentElement)
        }
        outputDict["\(currentCount)"] = array
    }else{
        outputDict["\(currentCount)"] = [currentElement]
    }
    
}


struct Size{
    var width = 0.0, height = 0.0
    
}
struct Point{
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberWiseRect = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 2.0, height: 3.0))

extension Rect{
    init(centre: Point, size: Size) {
        let originX = centre.x - (size.width / 2)
        let originY = centre.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centreRect = Rect(centre: Point(x: 4.0, y: 2.0), size: Size(width: 8.0, height: 8.0))

extension Int{
    subscript(digitIndex: Int) -> Int{
        var decimalBase = 1
        for _ in 0..<digitIndex{
            decimalBase *= 10
        }
        print(decimalBase)
        return (self / decimalBase) % 10
    }
}
0987654321[6]
//raw values
enum CompassPoints: Int{
case north
case south
case west
case east
}
let compassHeadings = CompassPoints.east.rawValue
print(compassHeadings)

//associated values
enum DeckOfCards{
    case numberCards(Int)
    case letterCards(Character)
    case color(String)
}

var cards = DeckOfCards.numberCards(10)
cards = DeckOfCards.color("red")
cards = DeckOfCards.letterCards("K")

switch cards {
case let .numberCards(number):
   print("\(number)")

case .letterCards(let letters):
    print("\(letters)")
case .color(let colorCards):
    print(colorCards)
}

cards = DeckOfCards.color("black")

enum Planet: Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let mars = Planet.mars.rawValue
print(mars)
let planet = Planet(rawValue: 7)



let position = 11
if let somePlanet = Planet(rawValue: position){
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
}
    else{
        print("There isn't a planet at position \(position)")
    }
//Clossures

let blanckClosure = {(() -> Void).self}

let fourTimes = {() -> Int in
    return 4
}

let callClosure = fourTimes()
print(callClosure)
print(callClosure)
print(callClosure)
print(callClosure)

let greetings = {(name: String) -> Void in
    print(name)
}

greetings("Grey")
greetings("Yellow")
greetings("Red")
greetings("Pink")



let sumClosure = {(numbers: [Int]) -> Int in
    return total
}
print(sumClosure([1,2,3,4,5]))

let names = ["Johnny","Nellie","Aaron","Rachel"]

var fullNames: [String] = []
for name in names{
    let fullName = name + " Smith"
    fullNames.append(fullName)
}
let fullName  = names.map { (name) -> String in
    return name + " Smith"
}

let stillShortened = names.map{$0 + " Smith"}

let arrayNumbers = [4,8,9,20,40,3,5,79]
var numbersLessThan20: [Int] = []
for number in arrayNumbers{
    if number < 20{
        numbersLessThan20.append(number)
    }
}

numbersLessThan20 = arrayNumbers.filter({ (number) -> Bool in
    return number < 20
})

print(numbersLessThan20)

numbersLessThan20 = arrayNumbers.filter({ $0 < 20
})

let numberOfArray = [1,2,3,4,5,6,7,8,9]
var total = 0
for number in numberOfArray{
    total = total + number
}

total = numberOfArray.reduce(0, { (currentTotal, newValue) -> Int in
    return currentTotal + newValue
})
print(total)

total = numberOfArray.reduce(0, { $0 + $1
})

print(total)

class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "The description will return \(currentSpeed)"
    }
}
