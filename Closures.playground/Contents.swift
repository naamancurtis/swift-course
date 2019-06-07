import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add (n1: Int, n2: Int) -> Int {
    return n1 + n2
}

func multiply (n1: Int, n2: Int) -> Int {
    return n1 * n2
}

// Example - transforming multiply into a closure
calculator(n1: 2, n2: 3, operation: {(n1: Int, n2: Int) -> Int in
    return n1 * n2
})

// Example - Minimising the code
let calc1 = calculator(n1: 4, n2: 5, operation: {(n1, n2) in n1 * n2})

// Even more minimal - $0 = parameter 1, $1 = parameter 2
let calc2 = calculator(n1: 15, n2: 20, operation: { $0 * $1 }) // the return is inferred by the fact you're passing data to be processed

// If the closure is the last parameter for a function you can create a trailing closure
let calc3 = calculator(n1: -3, n2: 29) { $0 * $1 }

print(calc1)
print(calc2)
print(calc3)


let array = [6,2,32,5,2,13,123,23,2,4]

func addOne(n1: Int) -> Int {
    return n1 + 1
}

array.map(addOne)

print(array.map{ $0 + 2 }) // as It's trailing, you don't even need the map() parenthesis


// Useful way of transfering everything in an array to a string

let newStringArray = array.map{"\($0)"}
print(newStringArray)
