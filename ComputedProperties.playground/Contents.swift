import Foundation

// Observed Property
var pizzaInInches: Int = 10 {
    willSet { // Executes just before the property is changed
        print(pizzaInInches)
        print(newValue)
    } didSet { // Executes just after the property is changed
        print(oldValue)
        print(pizzaInInches)
        if pizzaInInches >= 18 {
            print("Invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }
    }
}
var numberOfPeople: Int = 6
let slicesPerPerson: Int = 5

// Computed Properties
var numberOfSlices: Int {
    get {
        return pizzaInInches - 4
    }
}

var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    } set {
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 4 // This calls the setter
print (numberOfPizza) // This calls the getter







// === Notes ===

/*
 Computed Properties
  - Must explicitly state the data type
  - It is effectively a getter (shorthand for it)
 */
//var numberOfSlices: Int {
//    return pizzaInInches - 4
//}

// A Formal getter would be written as
// If you only set a "Get" Then it is effectively a read only property, you cannot manipulate it or assign new data to it
//var numOfSlices: Int {
//    get {
//        return pizzaInInches - 4
//    }
//}

// You can expand on Computed Properties by creating a setter as well
//var numbOfSlices2: Int {
//    get {
//        return pizzaInInches - 4
//    } set {
//        print("numberOfSlices now has a new value which is \(newValue)") // newValue is a special property within computed properties
//    }
//}


