import UIKit

/*
 ================================================================================
 ===                                 Notes                                    ===
 ================================================================================
 - Singletons are objects where only a maximum of 1 of them can exist at any time
 ================================================================================
 */

// === Examples of Common Default Swift Singletons ===
let defaults = UserDefaults.standard // In this case the "standard" is the initialised Singleton which is present within the UserDefaults class
let sharedURLSession = URLSession.shared


// === How a Standard Class Works ===
class Car {
    var colour = "Red"
}

let myCar = Car()
myCar.colour = "Blue"

let yourCar = Car()
print(yourCar.colour) // Would print "Red" As you have only changed myCar.colour to "Blue"


// === Creating a Singleton ===
class Motorbike {
    var colour = "Red"
    
    static let singletonMotorbike = Motorbike()
}

let myBike = Motorbike.singletonMotorbike
myBike.colour = "Blue"

let yourBike = Motorbike.singletonMotorbike
print(yourBike.colour) // Would print "Blue" as we've altered the Singleton Class
