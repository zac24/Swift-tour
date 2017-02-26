

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

// Closure




