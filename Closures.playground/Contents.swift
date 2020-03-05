import UIKit

var str = "Hello, playground"

class Singer {
    func playSong() {
        print("Shake it off!")
    }
}

// Unless told otherwise, Swift uses Strong Capturing.

// A function that returns a closure.
func sing() -> ()->Void {
    let taylor = Singer()
    
    let singing = {
        taylor.playSong()
        return
    }
    
    return singing
}

// The way that Taylor is created inside of there but remains alive so long as the return of sing() exists in some value.
