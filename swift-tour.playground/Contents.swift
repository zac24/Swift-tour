

print("Hello, World!")

let label = "The width is"
let width = 94
let labelWidth = label + " \(width)"

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList [1] = "bottle of water"
print(shoppingList)

var occupations = ["Malcom" : "Captain", "Kaylee" : "Designer",]
occupations["jayne"] = "Public Relations"

let emptyArray = [String]()
let emptyDictionary = [String : Float]()

shoppingList = []
occupations = [:]

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "Prashant Dwivedi"
var greeting  = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)

let nickName: String? = "Zac"
let myName: String = "Prashant Dwivedi"

let informalGreeting = "Hi \(nickName ?? myName)"


// Switch-case
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add Something to make good")
    case "cucumber", "watercress":
    print("That would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print ("It is a spicy \(x)?")
    
default:
    print("Everything tastes good in soup")
    
}


// Use of for-in loop
let  interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]

var largest = 0
var trackType : String = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            trackType = kind
        }
    }
}
print(largest)
print(trackType)

// while loop
var n = 2
while n < 100 {
    n = n*2
}
print(n)


// Do-while loop
var m = 2
repeat {
    m = m*2
}while m < 100
print(m)

// range of indexes  ..<(to ommit upper bound), ...(to keep the upper bound)
var total = 0
for i in 0..<4 {
    total += i
}

for i in 0...4 {
    total += i
}

// Functions and Closures

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)"
}
greet(person: "Prashant", day: "Saturday")

func greet(_ person:String, on day:String) -> String{
    return "Hello \(person), today is \(day)"
}
greet("Prashant", on: "Saturday")



func calculateStatistics (scores:[Int]) -> (min:Int, max:Int, sum:Int){
    var min = scores [0]
    var max = scores [0]
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

let statstics = calculateStatistics(scores: [5,3,100,3,9])
print(statstics.sum)
print(statstics.1)


// function can also take the variable number of arguments

func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers{
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 3,5,7,8,2,10,14)

// Functions can also take a variable number of arguments, collecting them into an array.

func avgOf(arguments: Int...) -> Int{
    var sum = 0
    var count = 0
    
    for number in arguments {
        sum += number
        count += 1
    }
    return (sum/count)
}

avgOf(arguments: 1,2,3,4,5)

// Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.

func returnFifteen() -> Int {
    var y = 10
    func add(){
        y += 5
    }
    add()
    return y
}

returnFifteen()

// Functions are a first-class type. This means that a function can return another function as its value.

func makeIncrement() -> ((Int) -> Int){
    func addOne (number:Int) -> Int{
        return 1+number
    }
    return addOne
}

let increment = makeIncrement()
increment(7)

// A function can take another function as one of its arguments 

func hasAnyMatch(list:[Int], condition:(Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen (number:Int) -> Bool {
    return number < 10
}

hasAnyMatch(list: [11,15,13], condition: lessThanTen)

// =============== Closures ============================
/*Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use "in" to separate the arguments and return type from the body.*/

var numbers = [20,19,7,12]

let mappedNumbers = numbers.map({
    (number:Int) -> Int in
    let result = 3*number
    return result
})
print(mappedNumbers)

// You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.

let mappedNumber = numbers.map({number in 3*number})
print(mappedNumber)

/*You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.*/

let sortedNumbers = numbers.sorted {$0 > $1}   // you might wanna try sorted(by:<)
print(sortedNumbers)

/* Objects and Classes
 
 Use class followed by the class’s name to create a class. A property declaration in a class is written the same way as a constant or variable declaration, except that it is in the context of a class. Likewise, method and function declarations are written the same way.*/

class Shape {
    var numberOfSides = 0
    let numberOfColors = 4
    
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides."
    }
    func useOfletWithParameter(numOfColors:Int) -> String {
        return "A Shape with \(numberOfColors) colors."
    }
}

//Create an instance of a class by putting parentheses after the class name. Use dot syntax to access the properties and methods of the instance.
var shape = Shape ()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
var shapeColors = shape.useOfletWithParameter(numOfColors: 5)


//This version of the Shape class is missing something important: an initializer to set up the class when an instance is created. Use init to create one


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name:String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A Shape with \(numberOfSides) sides."
    }
}

/*Notice how self is used to distinguish the name property from the name argument to the initializer. The arguments to the initializer are passed like a function call when you create an instance of the class. Every property needs a value assigned—either in its declaration (as with numberOfSides) or in the initializer (as with name).
 
 Use deinit to create a deinitializer if you need to perform some cleanup before the object is deallocated.
 
 Subclasses include their superclass name after their class name, separated by a colon. There is no requirement for classes to subclass any standard root class, so you can include or omit a superclass as needed.
 
 Methods on a subclass that override the superclass’s implementation are marked with override—overriding a method by accident, without override, is detected by the compiler as an error. The compiler also detects methods with override that don’t actually override any method in the superclass. */


class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength*sideLength
    }
    
    override func simpleDescription() -> String {
        return "A Square with sides of length \(sideLength)"
    }
}

let test = Square (sideLength: 5.2, name: "My test square")
test.area()
test.simpleDescription()


/*EXPERIMENT

Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class. */

class Circle: NamedShape {
    var valueOfRadius: Double
    
    init(radiusOfCircle:Double, name:String) {
        self.valueOfRadius = radiusOfCircle
        super.init(name: name)
    }
    
    func area() -> Double {
        return (valueOfRadius*valueOfRadius*3.14)
    }
    
    override func simpleDescription() -> String {
        return "The area of radius \(valueOfRadius)"
    }
    
}

let circlrArea = Circle (radiusOfCircle:5, name:"My Circle")
circlrArea.area()
circlrArea.simpleDescription()


// In addition to simple properties that are stored, properties can have a getter and a setter.

class EquilateralTriangle: NamedShape {
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
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

/*In the setter for perimeter, the new value has the implicit name newValue. You can provide an explicit name in parentheses after set.

Notice that the initializer for the EquilateralTriangle class has three different steps:

Setting the value of properties that the subclass declares.
Calling the superclass’s initializer.
Changing the value of properties defined by the superclass. Any additional setup work that uses methods, getters, or setters can also be done at this point.
If you don’t need to compute the property but still need to provide code that is run before and after setting a new value, use willSet and didSet. The code you provide is run any time the value changes outside of an initializer. For example, the class below ensures that the side length of its triangle is always the same as the side length of its square.*/

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


/*When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.*/

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
















