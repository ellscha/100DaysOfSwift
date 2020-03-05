/*
Objective-C is an Object Oriented Programming (OOP) language. OOP means that the language supports:
    * Encapsulation
    * Data hiding
    * Inheritance
    * Polymorphism
This guide will take you through the basics of Objective-C, rather quickly, as a refresher for those who have gone to Swift and never thought to look back.
*/

// Swift usually imports UIKit, with Objective-C we want to make sure we import the foundation framework.
#import <Foundation/Foundation.h>
// The Foundation Framework contains Collection types, a lot of string manipulation methods and other basic mathematical methods and many other basic and necessary features.

// When workin in Objective-C it is important to remember the core syntax and nuances that make it function. I will make sure to annotate when we encounter such syntaxes but the first one I will mention is the semi-colon. Objective C statements/lines end with a semi-colon. `;`

/*  Anonther syntax to know `\\ Inline Comments` and Multi-line-comments. (Started above and closed below. Forward slash * to start and * Back Slash to end.)
*/

/* 
*Types*
    * Basic Types
        * Integers
            ** Char, UnsignedChar, SignedChar, Int, UnsignedInt, Short, UnsignedShort, Long, UnsignedLong
        * Floating-Point Types
            ** Float, Double, LongDouble
        * Bool
    * Enumerated types
    * Void
        * Functions can return Void
        * Functions can take Void as parameter
    * Derived Types
        * Pointer Types (Containing * in their declaration) - NSString (e.g)
        * Arrays
        * Structures
        * Unions
        * Functions
*/

// When defining variables, you indicate the type so the program can allocate the proper amount of space to create the variable. You can define and/or initialize a variable in a single line of code. Here are some examples of defining variables.

// Three integers defined named 'a', 'b', 'c'
int a, b, c;

// A definition of char named 'cha'
char cha;

// A definition of float named 'totalAmount'
float totalAmount;

//An Initialization and definition of a float and char.
float totalPayment = 12.53;
char initial = 'E';

// There is a keyword `extern` that allows you to declare a variable somewhere in the program and then initialize/define the variable at some other point.

// Declaration (comes before/ outside of main func)
extern int age;
// Definition and initialization
int age = 23;

// Constants/Literals: Values that once declared and defined are unchangeable (a `let` Swift Equivalent) We can use `#define VARNAME value` (there is no semi-colon in #define statements) or we can use `const type varName = value;`
#define PI 3.14159

const float PI_6 = 3.141592;

const bool isTRUE = true;

// To print something to the console in Swift one would use print(), in Objective-C we log things to the console in the same way. `NSLog(@"string input to print and a formatter if necessary like a number %d, or a character like %c", integerForString, characterForString); Make sure to remember the `@` which comes before string literals.

NSLog(@"Here is a number %d and a character %c", age, initial);

// Strings: The best way to create a string is using the `@` construct.
// We state the type: NSString use a pointer when naming the variable *stringVar = @"String.";

NSString *helloWorld = @"Hello World";
NSString *upperHelloWorld = [helloWorld uppercaseString];

// Let's initialize integers a, b and c that we defined earlier and then put them in an integer array and get a feel for Objective-C arrays.

a = 1;
b = 2;
c = 3;

// We will first create an integer array with size 3. The formatting for this is: `type arrayName [intSizeOfArray];

int arrayABC [3];
arrayABC = {a, b, c};

// We could also not define a size and create an array like this:

float floatingArray [] = {0.0, 1.0, 2.0, 3.0, 4.0};

// A constant array (a swift let equivalent) looks like the following:
NSArray *recordTempsInFar = @[@90, @85, @97];
// Notice the `@` symbol that comes before objects.

// Making an array Mutable means it is changeable.
NSMutableArray *array = [NSMutableArray new];
[array addObject: floatingArray];
// TODO: Check.
// Another collection type is a Dictionary
NSDictionary *abcGreekokay = @{ @"A": @"Alpha", @"B": @:"Beta", @"C": @"Gamma" };

// We could log the first element in the array like this:
NSLog(@"The first element in the array is %f", floatingArray[0]);
/* Operators:
    * Arithmetic
        ** Addition
            * a + b
        ** Subtraction
            * a - b
        ** Increments
            * a++ (increment by one)
            * a-- (decrement by one)
        ** Division
            * a / b
        ** Multiplication
            · a * b
        ** Modulo
            * a % b
    * Relational
        ** are equal - a == b
        ** not equal - a != b
        ** greater than - a > b
        ** greater than or equal to - a >= b
        ** less than - a < b
        ** less than or equal to - a <= b
    * Logical
        ** AND -  a && b
        ** OR - a || B
        ** NOT - !a
    * Assignment
        ** assign is: a = 10
        ** plus equals: a += 10
        ** minus equals: a -= 10
        ** times equals: a *= 10
        ** divided by equals: a /= 10
        ** modulo equals: a %= 10
    * Misc
        ** use `&` to return the memory address
        ** use `*` as a pointer 
        ** for a ternary operation use `bool: x ? y`
*/ 

int x = 10;
int y = 20;
int added = x + y; // added will be 30
int subtracted = y - x; // subtracted will be 10
int multiplied = x * 3; // multiplied will be 30
int divided = y / x; // divided will be 2
int modulo = y%x; // modulo will be 0
int incr = 0;
incr++; // incr is now 1
x--; // evaluates to 9

// Now let's use the Logic Operators and learn about conidtionals in Objective-C.

bool truthyVal = true;
bool falseyVal = false;

if (truthyVal && true) {
    NSLog(@"Condition is true, true AND true is true.");
}

if (truthyVal || falseyVal) {
    NSLog(@"Condition is true, true OR false is true.");
} else if (truthyVal) {
    NSLog(@"Condition 1 was true, would I be here?");
} else {
    NSLog(@"Condition 1 and then 2 was true, would I be here?");

}

if (!falseyVal) {
    NSLog(@"Condition is true, NOT false is true.");
}

// Switch statement:

switch (age) {
case age <= 17:
    NSLog(@"You still got so much to learn");
case age < 21 && age >= 18:
    NSLog(@"Don't forget to vote!");
default:
    NSLog(@"You do you!");
}

/* Loops:
    * For Loop
    * While Loop
    * Do While Loop -- (In Swift this is repeat while)
    * Nested Loops
        * Nested Loops
            * Nested Loops
    
 * Loops Terminators
    * Break - stop everything, leave the loop.
    * Continue - don't finish running this iteration of the loop, go back to the beginning of the loop and continue.
*/

// One thing I love is the C style for loop: for (int; condition; increment) {}

// Create the int for the loop (counter)
int i;
for (i = 0; i < 10; i++) {
    NSLog(@"%d", i);
}

// While and Do While are structured like this: 
/*
    while (truthy condition) {
        code;
    }
*/
/*
    do {
        code;
    } while (truthy condition);
*/

int whileExampleInt = 10;
while (whileExampleInt > 10) {
    NSLog(@"This should pring 5 times.");
    whileExampleInt -= 2;
}

do {
    NSLog(@"code will run first and then check the condition, this line will always print at least once.");
} while (false);

// The nested loop I will use a for loop.
int j;

for (i=2; i<100; i++) {
    for(j=2; j <= (i/j); j++)
        if(!(i%j)) break;  // if factor found, not prime
        if(j > (i/j)) NSLog(@"%d is prime\n", i);
}

/*
 Let's built a function with this structure.
    - (return type) func_name: (parameter1Type) param1Name secondNumberParameterName: (param2Type) param2Name { return }
*/

int square (int base) {
    return (base * base);
}


int twoSquared = square(2)
NSLog(@"%d", twoSquared);

void sayHello ()
{
      NSLog (@"Hello");
}

sayHello() // Will Log "Hello"

