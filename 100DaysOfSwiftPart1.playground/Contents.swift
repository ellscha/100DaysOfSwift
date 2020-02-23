import UIKit

var str = "Hello, playground"

//100 Days of Swift P1.

/// #Day 1

///Definitely a review of things I know, one thing I _did_ learn is that you can write numbers with `_`s in them so that it keeps them clearer.
///e.g `var million = 1_000_000` is easier to read than just `var million = 1000000`.
///I will recap all lessons regardless of level just so I have everything in one repo for anyone who cares to peep.

///Declaring constants  vs variables. Constants cannot be changed (the value they are given is the value they remain). Whereas variables (as the name would suggest) _can_ vary in value. I will begin by declaring a constant string called placeOfBiirth as someone's place of birth is a constant (you cannot change where you were born, only maybe lie about it.) I will let declare a variable called age.

// Constant placeOfBirth
let placeOfBirth = "USA"

// Variable age (can change)
var age = 23

///String and Integers. Notice the variables above, placeOfBirth is a String and age is an Integer. One great thing about Swift is that it is a type-safe language, every variable (and constant (also considered a variable in the grand scheme of things)) must be a single specific type. String and Integer are two possible types. Trying to change `age = "23"` would be illegal because `"23"` is not an Int and the variable `age` must contain an integer value because that is how it was declared.

///If you have a string that should span multiple lines rather than using `"` (double quotes) you should you `"""` to begin and end quotes. _It is important to keep the `"""`s on their own line separate from the text that composes the string.

var haiku =
"""
Using Swift Language
Makes Learning To Code Easy
Apple Over Droid
"""

///Even though it looks different than other strings, the variable `haiku` still has the same type as placeOfBirth: `String`. Two other types are Doubles and Booleans. A Double is one of the number-type values in swift. Doubles are different than Integers because Doubles contain a decimal point. You cannot change an Int into a Double the same way you cannot change a Double into an Integer.

var euler = 2.71828

/// A Boolean is a `true` or `false` value.

var isCorrect = true

///Say you want to make a string that contains the value of age, but you don't know what age is at that moment in time...Enter String Interpolation. I will demonstrate below the opportunities string interpolation gives us.

print("Today I am \(age)")
print("Tomorrow is my birthday and I will be \(age + 1)")

/// The format of enclosnig a variable to interpolate into a String is `\(value)`.
/// The final lesson for Day 1 in 100 Days Of Swift is Type Inference. In the examples above, Swift knows what type each value is without me having to tell, this is called type-inference. You can, however, be explicit when creating variables. This is probably the most in depth I will be going into any specific lesson. I will leave detailed comments as requested or as I see fit for my own personal learning.

var thisIsDefinitelyAString : String = "I told you so!"

/// #Day 2

/// Arrays store values as they are entered and order _does_ matter.

// Arrays
let zero = 0
let one = 1
let two = 2
let three = 3

// This array is an array of type [Int]
let zeroToThree = [zero, one, two, three]

// You can access items in the array by using the index of the item you want in the array. Indices begin at value 0 (The first element in the array is at index 0).

var firstItemInArray = zeroToThree[0]

/// Sets! A set unlike an array does not maintain its order and does not retain duplicates. If you storing names of students in a class I'd recommend using an array because you may have more than one "Luke" in the class.


let ikeaShoppingListSet1: Set = (["Chair", "Table", "Couch"])
let ikeaShoppingListSet2 = Set(["Chair", "Table", "Couch", "Chair"])

// Both sets above end up being the same

/// Tuples are ordered pairs (or more than two values) that can be accessed using either their index or their property name (that you set).

let chairsToBuy = (furniture: "Chair", amount: 2)
let numberOfChairs = chairsToBuy.amount // Could have also done chairsToBuy.1
let itemToBuy = chairsToBuy.0

// Dictionaries are closer to arrays. They are key value pairs where the keys must be unique. They are similar to arrays except instead of using indices to access items you can use anything (either the key or the value).
var itemsToBuyAtIkea : [String: String] = [
    "Chair": "2",
    "Table": "1",
    "Couch": "1"
]
itemsToBuyAtIkea["Television Stand", default: "Unknown"]

/// To initialize an empty collection using any of these types do the following:

//Array
var gradeValues = [Int]()

//Set
var possibleGrades = Set<Double>()

//Dictionary
var grades = [String: Double]()
grades["Elli"] = 100.0
print(grades)

//Tuple
print("Just kidding! There is no such thing as an empty tuple.")

/// *ENUMERATIONS* I'm excited to finally understand enums!
/// Enums are a way of defining states or related values.

enum GameStatus: Int {
    case win
    case loss
    case inProgress
}

let currentGame = GameStatus.inProgress

// That's great, but let's go one step furthr.
enum waterPoloGameStatus {
    case win(byPoints: Int)
    case loss(letsBlame: String)
    case inProgress
}

let earlierGame = waterPoloGameStatus.win(byPoints: 12)

// enums also add raw values like so:

enum tournamentStandings: Int {
    case gold = 1
    case silver
    case bronze
}

var thirdPrize = tournamentStandings(rawValue: 3)


/// #Day 3
/// MATH!!! I was, admittedly, a Mathlete in high school. With that, let's begin.
/// `+, -, *, / and % ` I will write it out as an enum just so we can review.

enum operators: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case modulo = "%"
}

var stringAboutAdding = "2 \(operators.add.rawValue) 2 = \(2+2)"

/// The `%` operator returns the remainer of a division problem 100 % 26 will return 22 because 26 goes into 100 3 times with a remainder of 22

var modulo = 100 % 26

/// You can use + to add more than numbers, you can add string or even arrays (if they have the same type).

let zeroToFive = zeroToThree + [4,5]

let checkYourself = haiku + "\nI hope that's the right amount of syllables!"

/// The  `/n` is a way to format a string as to say new line or return carriage
print(checkYourself)

//Another way we could've written the previous variable is with a compound operator: += I could change the value stored in haiku. (If the point is to create a new variable so that you still have access to the original do not use compound var)

var badHaiku = haiku
badHaiku += "oops, now it's not a haiku."

/// Comparative Operators. You can compare numbers, truthiness, strings, anything your heart desires (not really, but you know).

// != is not equals
tournamentStandings.gold.rawValue != tournamentStandings.silver.rawValue
// BUT
tournamentStandings.gold.rawValue == GameStatus.loss.rawValue
// That one is tricky but hopefully gives you a little insight into how indices work and when you saw a raw value vs letting swift make its own raw value (starting at 0).

/// You can also check less than `<` and greater `>` than as well as `<=` and `>=` less than or equal to and greater thanor equal to. You can use those operators on strings to check for alphabetization! (I didn't know that before!)

var trueStory = 1 < 2

/// CONDITIONALS
/// I like all of the examples used in 100 Days of Swift, but I particularly like the examples used in this segment.

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
}

/// The code inside of the `{}` braces get executed if the condition is true, you can also create a backup plan if there is something specific you want to do using ` else` and if it is a case you want to make non binary (more than true or false) conditional you can use `else if` with it's own conditional statement

if firstCard + secondCard == 2 {
    print("Aces – lucky!")
} else if firstCard + secondCard == 21 {
    print("Blackjack!")
} else {
    print("Regular cards")
}

/// We can combine conditional statements use logic gates of OR `||` and AND `&&`

if firstCard >= 10 && secondCard >= 10 {
    print("These cards add up to at least 20")
}

if firstCard <= 10 || secondCard <= 10 {
    print("At least one of these cards is less than or equal to 10")
}

/// There is another operator called the ternary operator which can be used instead of an if else statement like so:

//Instead of
if firstCard == secondCard {
    print("Cards are the same")
} else {
    print("Cards are different")
}
// Using ternary operator you could simplify this to
print(firstCard == secondCard ? "Cards are the same" : "Cards are different")

/// SWITCH STATEMENTS!
/// If and if else are great, but when you have a lot of cases a switch statement is the way to go. Switch statements must be exhaustive, there should never be a conditional that falls through or doesn't meet any of the provided cases so you should provide a _default_ value.

let suit = "spade"

switch suit {
case "hearts":
    print("queen of hearts")
case "spades":
    print("ace of spades")
case "diamonds":
    print("eight of diamonds")
case "clubs":
    print("nine of clubs")
default:
    print("aces high")
}

/// Here is a switch statement that also usese a `fallthrough` this example utilizes string concatenation and switch and interpolation!
let integerToDescribe = 2
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2:
    description += " an even number,"
    fallthrough
case 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)
// Prints "The number 5 is a prime number, and also an integer."

/// Range operators, let's say you want to check if someone got a grade  0 through 50, or 50 through 85 you can use range operators.
/// `x..<y` is non inclusive of `y` rather:`[x,y)` if that tickles your fancy. Whereas `x...y` is an inclusive range x to y or `[x,y]`.

let score = 62

switch score {
case 0..<50:
    print("You failed badly.")
case 50..<85:
    print("You did OK.")
default:
    print("You did great!")
}


/// Loops!

/// For loops go item by item in an array or range of numbers where you can do something `for` each value in one code block!

let ageRange = 15...21

for age in ageRange {
    var ageString = "You just turned \(age) which means a lot of new opportunities! Make sure you"
    switch age {
        case 21:
        ageString += " always drink responsibly."
        fallthrough
    case 18,19,20:
       ageString += " While you're at it, head over to the polls and vote!"
       fallthrough
    case 16, 17:
        ageString += " Drive safe! "
    default:
        print("No fun things to do yet!")
    }
    print(ageString)
    
}

/// Let's say you don't care about the small details and you just want to do something x amount of times
age = 15
var birthdayString = "I will put, in my birthday cake a candle."

for _ in 1..<age {
    birthdayString += " And another candle."
}
birthdayString += " And one more for good luck!"

/// Another type of loop is a while loop. _While something satisfies a certain condition execute the follow._

var daysUntilMyNextBirthday = 0

//Assuming not a leap ear.
while daysUntilMyNextBirthday < 365 {
    //1 day less to go!
    daysUntilMyNextBirthday += 1
}
if daysUntilMyNextBirthday == 365 {
    print("it must be my birthday!")
}
// Okay that was an extreme example... but 🤷‍♀️
// Another way to do the while loop is called a repeat loop where the code inside the bllock will alwas be executed at least once ( it is executed prior to the while condition being checked.

repeat {
    print("This is false")
} while false

/// Even though you are looking for a condition that is false in this case, while must always be a true evaluation to execute.
/// There might even be a time where you want to exit the loop prior to the loop reaching an end. e.g you are waiting until you pick an ace of spades from a deck.

//Let's say that card #43 is the ace of spades.

let deck = 1...52

for i in deck {
    //Still looking for ace of spades.
    if i == 43 {
        break
        // The break keyword will _break_ out of the loop no questions asked.
    }
}


// SO COOL I DID NOT KNOW YOU COULD NAME YOUR LOOPS!!!!! (AND THNE BREAK OUT OF THEM ACCORDINGLY!)

/// Again using the example from 100 Days of Swift:

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}

/// Let's go back to the cards example. Let's say you don't want to exit out of the loop, you just want to keep going...

for i in deck {
    //Still looking for ace of spades.
    if i == 43 || i == 12 {
        print("found your card.")
        continue
        // The continue keyword will _continue_ through the loop.
    }
}


/// Infinite loops are a _DANGER ZONE_! if you were to write while true.... the loop would go on forever....And again taking from 100 Days of Swift
var counter = 0

while true {
    print(" ")
    counter += 1

    if counter == 273 {
        break
    }
}

/// Here is one way to utilize an infinite loop without letting it destroy your progress.

/// ##Functions!
/// We use functions to simplify, organize and utilize out code to the max!
/// Functions make it easy to reuse code which makes code very readable (in most cases but I'm sure there is some rando outlier).
/// We have already been using a function called print. it is a system function and it is _called_ many times throughout this file.
/// Functions can take parameters and can also output values. I'm going to skip ahead a bit and use parameters for now. If anyone is actually reading this, and wants me to review, let me know.

// Let's write out own print function! (it will take a parameter and will have no output value (a function with no output is called a void function!)
func printGiven(string: String) {
    print(string)
}

printGiven(string: "FUNC YEAH!")

// We can write low level math functions the same way and we can give an output value. And we can call functions inside of functions! (I'll take some more examples that are very smart and well written from 100 days of swift!

func square(number: Int) -> Int {
    var result = number * number
    printGiven(string: "\(number) squared is \(result)")
    return result
}

square(number: 4)

/// You can give a parameter more than one name which helps with readability.

func sayHello(to name:String) {
    print("Hello, \(name)")
}

sayHello(to: "Taylor")

/// That makes a world of difference when reading code and understanding it. So, with the function print, (which doesnt have a parameter name but still takes a parameter (the thing you print)). That is done with an underscore. "Say hello to" is a great function because it reads like a sentence! Print (the system one, not my silly example) is great as well! always better to provide more detail in my opinion so I don't know if I've ever used the following in practice.

func greet(_ person:String) {
    print("Hello, \(person)")
}

greet("Tom")

/// With parameters, you might not always have a value at the time of calling a function...Enter _Default Parameters_!!! 🥳

func introducePeople(to firstName: String, lastName: String = "") -> String {
    let introduction = "Everyone, meet \(firstName) \(lastName)"
    return introduction
    // we could have just written this instead of 'let license' just writing return and then the string.
}

introducePeople(to: "Cher")
introducePeople(to: "James", lastName: "Bond")

/// I DID NOT KNOW ABOUT VARIADIC FUNCTIONS, LET'S EXPLORE THEM TOGETHER NOW!
/// I knew that I could print multiple things as a comma separated list print(firstName, lastName) e.g
/// I didn't know that has a special name: _variadic_
/// You can make any parameter variadic by adding an ellipses (...) after the Type.

func writeSongs(about topics: String...) {
    for topic in topics {
        print("""
                La La La
                \(topic) is cool!
                Yeah!
              """)
    }
}

/// If everything always went to plan, that would be _Sweet_, but alas.... We can _throw_ errors in functions to try and _catch_ these errors. I'll once again borrow the example for 100 days of swift.

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

/// Throw functions are not able to be called unintentionally, they require the keywords: _do_, _try_, and _catch_
/// You DO _run a block of code that could result in an error_ TRY _the function that throws and see what happens_ and lastly CATCH _the error if it occurs, so it doesn't ruin your program_
do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

/// _inout_ is a type of parameter that is changed in place rather than setting something equal to the value of a function's return.... when we call the function we use the ampersand to indicate that it is an inout parameter

var number = 100
func makeZero(number: inout Int) {
    number *= 0
}

makeZero(number: &number)

