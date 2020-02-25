import UIKit

var str = "Hello, playground"
 
/// #Day 8: Structs, Properties, Methods
/// The last thing we did was _Closures_. The next thing we are going to work with is _Structs_!
/// We have seen types like `String`. `Int`,`Double`... But using structs, we can make our own data-types using a grouping of the primitive datatypes.
/// For example, we could make a Person type using two Strings and an Int (First name, Last name, and age.)

/// We give variables and functions lower case names, but struct naming takes a first letter as a capital.

struct Person0 {
    var firstName: String
}

/// Now we can use the Person struct type we just created to set the value of a variable. Use `.` notation to access properties and methods.

var elton = Person0(firstName: "Elton")
print(elton.firstName)

/// We can change those var values just like any other ones we've seen.
elton.firstName = "Sir Elton"

/// The first name element is called a stored property because of how it gets set. The other type of property is computed (where the computer uses given information to _compute_ a property.
struct Person1 {
    var name: String
    var isKnighted: Bool
    
    var greeting: String {
        if isKnighted {
            return "Hello there, Sir \(name)"
        } else {
            return "Suuuuuup \(name)"
        }
    }
}

/// In Person1 `greeting ` is a computed property here.

let sirElton = Person1(name: "Elton", isKnighted: true)
print(sirElton.greeting)

/// Property observers can be added in to let you run code before (willSet) or after (didSet) a property is changed. I will refer to the 100 Days of Swift example!

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

/// Structs can also have functions called methods inside of them.

struct CabRide {
    var destination: String
    
    func arrival() -> String {
        return "We have arrived at \(destination)"
    }
}

var timesSquare = CabRide(destination: "timesSquare")
timesSquare.arrival()

/// Swift is SOOOO type-safe that it won't let you accidentally change values crated in structs.

struct Song {
    var lyrics: String
    
    mutating func forgetLyrics() {
        lyrics = "La....La.....Dee da..."
    }
}

var song = Song(lyrics: "Hello, Dolly well hello Dolly!")
song.forgetLyrics()

/// The string type is also a struct. String has methods like `count ` which allows you to count the number of characters, `hasPrefix` which returns a bool if prefix of string is equal to specific entry... `uppercased` which makes the string all uppercase

let string = " hello there"

string.uppercased()
string.hasPrefix(" he")
string.sorted()


/// Arrays are also structs.

var fridgeItems = ["pudding"]
print(fridgeItems.count)
fridgeItems.append("eggs")
fridgeItems.firstIndex(of: "eggs")
print(fridgeItems.sorted())
fridgeItems.remove(at: 0)

/// #Day 9: Access Control, Static Properties, Laziness

/// initializers... a method that helps create an instance of the (in this case) struct. Structs by their nature come with an intializer where you have to set the elements, but you can write your own init functions so things are done as you wish. I will use the 100 Days of Swift Example.

struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
var user = User()
user.username = "@elli_no_e"

/// That last example I took creatie license and used my`self` as an example to segue into this next comment! `SELF` a keyword we are given inside of structs (and other places but we're here now, enjoy the moment).  If we are writing an initializer that accepts a parameter to set a property, we can use `self ` to distinguish the parameter with the property as @twostraws does in 100 Days of Swift in the following!

struct Person2 {
    var name: String

    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

/// I'm feeling truly lazy writing this at 10:48PM on a Sunday..... and then I turn the page to the lazy properties and realize.... this is why #GoWes. ANYWAYYY (can you tell I'm starting to be a little bit playful?) Cool. Anyways...LAZY VARS/PROPERTIES, for when you don't want to be pressured into anything you're not ready for. I'm going to refer back to 100 Days of Swift's example once again because i'm feeling a little lazy my self, and why fix somethin that ain't broke?

struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    // Without the keywrd lazy here, every time I initialize a new person, the FamilyTree initializer would run, with the lazy keyword here, we can hold off on creating the tree until we feel ready.
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")

/// There is a cool keyword we can use when creating structs, `static`.... Soooo I could create a bunch of people, and each time I create a new instance of a person everything can be completely unrelated, but if we add in the `static` keyword, we can have properties that are _shared_. The following example takes a hotel room and the number of occupied rooms will be a static variable because we don't want to set and reset that everytime we have a guest checking in.

struct HotelGuest {
    static var occupiedRooms = 0
    var lastName: String
    
    init(lastName: String) {
        self.lastName = lastName
        HotelGuest.occupiedRooms += 1
    }
}


var smith = HotelGuest(lastName: "Smith")
/// It wouldn't make sense to call occupiedRooms on the variable we just created `smith` so when we refer to static variables we use the Struct itself to refer to them as follows:
HotelGuest.occupiedRooms

/// Access control: means granting access to certain variables by specific things.... Like the passcode to your house alarn, you keep it private from some things. Private vars can be accessed within the struct in other methods, but cannot be referenced from outside. ( In the following example, I couldn't print alarm code from the main playground.... But I can make a method to print it.

struct House {
    private var alarmCode: String
    
    init(alarmCode: String) {
        self.alarmCode = alarmCode
    }
    
    func enterCode() -> String{
        return "Entering in the code \(alarmCode)"
    }
}

/// There are private variables, so, naturally there are also public variables which means that information is available from anywhere in a project.

/// #Day 10: Classes, Inheritance

/// Similar to structs, swift has another way of creating your own new data types, they are called `classes`. And you about to get _schooled_.
/// Classes do something that structs cannot...they can inherit. The way a human inherits features like eye color, hair color, code can also inherit. You could have an Animal class and a Dog class that inherits from Animal ( I wrote that before I read the first lesson, I animals and car are the main examples used when it comes to learning about classes.)
/// It's going to look _very_ similar to structs, don't worry, but remember they are different.
/// Classes MUST have an initializers when values are not set initially.

class Car {
    var make: String
    var model: String
    
    func revEngine() {
        print("VROOOOOM!")
    }
    
    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
}

let prius = Car(make: "Toyota", model: "Prius")
/// We made a car!

/// Now we will make a class called Toyota because everytime we have a Toyota we will just create a new instance of Toyota that inherits from Car. Inheriting _from_ `Car` makes `Car` a `super` class.....
/// The way we give variables a type with a color, classes that inherit use a colon as well!
class Toyota0: Car {
    init(model: String) {
        super.init(make: "Toyota", model: model)
    }
}


/// `For safety reasons, Swift always makes you call super.init() from child classes – just in case the parent class does some important work when it’s created.` -_100 Days of Swift_
/// I'm not claiming _at all_ to be saying anything better than it is said on the actual 100 Days of Swift page (I'm not tring to say it better), but I _literally_ could not have said this better myself, so I didn't bother trying.

/// Now, let's go over override, notice Car has a method called revEngine....but what if we have a prius? The rev is not deserving of an exclamation mark let alone a vroom. We can do what is called an `override` to a function that gets inherited from a super class.

class Toyota: Car {
    init(model: String) {
        super.init(make: "Toyota", model: model)
    }
    
    override func revEngine() {
        if self.model == "Prius" {
            print("🤫")
        } else {
            print("VROOOOOM!")
        }
    }
}

/// Let's say we have a class we DO NOT want to be inherited from, like `class RottenFood` we can make it a `final` class. Then the class will need to be used as written.

final class RottenFood {
    var food: String
    var foodGroup: String
    init(food: String, foodGroup: String) {
        self.food = food
        self.foodGroup = foodGroup
    }
}

/// Another difference between structs and classes: each struct points to a new instance and exists independently (aside from _static_ vars). Classes have a strong reference where if I create a new  `var lumpyMilk` as a rottenFood and then create `var clumpyMilk = lumpyMilk` if I change `clumpyMilk.name`, `lumpyMilk.name` will also update.
var lumpyMilk = RottenFood(food: "milk", foodGroup: "Dairy")
var clumpyMilk = lumpyMilk
clumpyMilk.foodGroup = "Almost Cheese"

print("\(clumpyMilk.foodGroup), \(lumpyMilk.foodGroup)")
// Almost Cheese, Almost Cheese

/// We can also create a de-initializer to run when an objecct is being destroyed.

final class RottingFood {
    var food: String
    let foodGroup: String
    init(food: String, foodGroup: String) {
        self.food = food
        self.foodGroup = foodGroup
    }
    
    deinit {
        print("It's about time we destroyed that!")
    }
}

/// Classes don't use the `mutating` keywords like structs do. If a property of a class is declared within the class as a constant (like foodGroup is above) then it can't be changed once it is set, but the food var can be changed without explicitly calling it `mutating`.

/// #Day 11: Protocols, Extensions,  Protocol-Extensions
/// Protocols are how we define methods or properties something has to have. Like a Person _must_ have a birthday.

//DOB Stands for Date of Birth
protocol Applicant {
    var resume: String { get set }
}

struct Human: Applicant {
    var resume: String
    
}

func reviewResume(resume: Applicant) {
    print("Begin reviewing applicant's \(resume)")
}

/// Protocol Inheritance is different from class inheritance because you can inherit from more than one protocol at a time.  Protocols that describe an ability should be named using suffixes like `able`, `ible`, or even `ing`. If it describes what something is, it should be a noun e.g Collection.
/// Taking the example from 100 Days of Swift


protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

/// Now when we make a new type that abides by the `Employee` protocol, it must conform to all of the protocols that `Employee` conforms to.
//struct WorkingPerson: Employee {
//    func calculateWages() -> Int {
//        <#code#>
//    }
//
//    func study() {
//        <#code#>
//    }
//
//    func takeVacation(days: Int) {
//        <#code#>
//    }
//
//
//}

/// EXTENSIONS allow you to add methods to existing types. If we wanted to add an extension to our `Car` we could.
extension Car {
    enum Gas: String {
        case Regular = "Regular"
        case Premium = "Premium"
        case Diesel = "Diesel"
    }
    func fillWith(gas: Gas) {
        print("Your car has been filled using \(gas)")
    }
}

var raceCar: Car = Car.init(make: "Mini", model: "Hatch")
raceCar.revEngine()
raceCar.fillWith(gas: Car.Gas.Diesel)

/// Extensions allow you to add code inside of methods. Protocols tell you what methods you must have. Extension Protocols allow you to do both. I'll take again from the Bible that has been leading these two playgrounds: 100 Days of Swift.

/// Note that both Array and Set conform to the Collection protocol.

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}
/// Since Arrays and Sets conform to the same protocol, we can use the summarize function on both types.

pythons.summarize()
beatles.summarize()

/// POP! (Protocol Oriented Programming).
/// So if I have a protocol that has two requirements, a property and a method... if I use that method a lot that means I have to write the function each time with the code inside of it that I want to be executed....Now if it is different code each time....fine but if it's the same thing....use the protocol oriented So with out Employee example above I'll write an example below. I'll write an example first of what it would be like without protocol extensions.

extension HasVacation {
    func takeVacationDays(days: Int) {
        print("See you in \(days) days!")
    }
}

/// #Day 12: Optionals (Not an optional topic).
/// Final of the fundamentals in 100 Days of Swift!
/// We did it!
/// Optionals help us deal with information we don't yet know. When you meet someone....if you don't know their name... You don't question whether or not they have one, the only thing you know is that you don't _yet_ know their name. Their name is just...empty to you. In Swift, that empty equivalent is called `nil` also known as null in other languages but in Swift `nil`. When creating a variable that could be nil (just as name is in the example we just walked through), we can make what is called an optional. With name, we are going to make a variabe that has type String optional, meaning it could be a string or it could be nil. It looks like this.


var name: String? = nil

/// By adding the `?` to `String` we are basically saying the variable name can take on the properties of the `String` type and employ methods like `count` or `uppercased()` *AND* it can take on the properties of nil....empty space... which has no properties and no methods.

print(name)

name = "Ed"

print(name)

/// When we print name the second time it comes out `Optional("Ed")`.
/// If we want to create a label and we want it to display the name variable, we _don't_ want the label to say Optional. We need to _unwrap_ the variable. Unwrapping an Optional is important and very often the cause of a warning symbol in the XCode environment showing up.
/// Swift is a type-safe language, this shouldn't be news at this point. As a type safe language, Swift doesn't want you to be able to accidentally call `nil.count` because that'll cause an error and crash your application. You have to be SO confident, and SO sure that you won't crash your application... This is when we unwrap the optional.

/// There are multiple ways to unwrap optionals. We will begin with `if let` here is how it looks.

if let unwrappedName = name {
    print(unwrappedName.uppercased())
} else {
    print("name is nil and unable to be unwrapped.")
}

/// You can think of it as an if statement where if a condition is satisfied do x else do y _in conjunction with_ a variable declaration. If `name` exists then it will be stored as `unwrappedName` and useable in the scope of the if statement. (`unwrappedName` can be called anything I usually name it the same name as the variable you are unwrapping.)
/// I typically prefer to use the next kind of unwrapper: `guard let`. Guard let isn't confined to the scope of the conditional statement but rather enters an else if the variable you are unwrapping is, in fact, nil.

func celebrate(_ occasion: String?) {
    /// Here is what I meant by the naming style I typically use.   `guard let occasion = occasion`
    guard let unwrappedOccasion = occasion else {
        print("Celebrating for no specific occasion!")
        // DO NOT FORGET TO BREAK OUT OF THE ELSE  (Swift will not let you).
        return
    }
    
    /// I can now use the unwrapped value that has type `String`
    print("Happy happy \(unwrappedOccasion)")
}

/// If you know FOR SURE that something is not nil, you can force unwrap it.
/// The example used in 100 Days of Swift is a good one.

let strng = "5"
let num = Int(strng)
/// Writing Int(var) is called casting, we are casting the string to be an int `num` has the type `Int?` because if strng is something like "hello", that cannot be converted into an Int.
/// To force unwrap we add an exclamation mark:

let thisIsDefinitelyANumber = Int(strng)!

/// If you force unwrap something and it ends up not having the type you assured the compiler it would have, your app will crash.
/// You can create a variable using an ! as well in the type that follows the `:` This is called an implicity unwrapped optional.

/// Another option for unwrapping an optional is to use the _nil coalescing operator_. Say you have a function that returns either `String` or `nil`. (I'll use the example from 100 Days of Swift)
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
/// We will call this function while setting a new variable's value, and can use the nil coalescing operator as to say I want to set this new variable equal to the return value of the function or a default value if the function returns nil.

let newUser = username(for: 15) ?? "Anonymous"

/// We have seen `.` notation for calling methods and properties. If something that 

