import UIKit

var monsterHealth = 19

// === Functions ===

monsterHealth += 20

monsterHealth /= 3

print(monsterHealth)

func getMilk(numOfMilkCartons: Int, howMuchMoneyRobotWasGiven: Int) -> Int{
    print("Walk to the shops")
    print("Buy \(numOfMilkCartons) cartons of milk")
    
    let priceToPay = numOfMilkCartons * 2
    print("Pay £\(priceToPay)")
    
    let change = howMuchMoneyRobotWasGiven - priceToPay
    return change
}

var amountOfChange = getMilk(numOfMilkCartons: 5, howMuchMoneyRobotWasGiven: 10)
print("Hello Master, here's your £\(amountOfChange) change")

// === End of Functions ===
// === Conditionals ===

func loveCalculator (yourName: String, theirName: String) -> String {
    let loveScore = arc4random_uniform(101)
    if loveScore > 80 {
        return "You love each other like Kayne loves Kayne"
    } else if loveScore <= 80 && loveScore > 40 {
        return "You go together like coke and mentos"
    } else {
        return "No love possible, you'll be forever alone!"
    }
}

print(loveCalculator(yourName: "Angela Yu", theirName: "Jack Bauer"))

// === End of Conditionals ===
// === Challenge ===

func bmiCalculator(weight: Float, height: Float) -> String {
    let bmi = weight / (height * height)
    let shortenedBMI = String(format: "%.2f", bmi)
    
    if bmi > 25 {
        return "You are overweight, your BMI is \(shortenedBMI)"
    } else if bmi > 18.5 {
        return "You within normal bounds, your BMI is \(shortenedBMI)"
    } else {
        return "You are underweight, your BMI is \(shortenedBMI)"
    }
}

print(bmiCalculator(weight: 85, height: 1.82))

// === End of Challenge ===
// === Loops ===
let arrayOfNumbers = [1, 5, 3, 4, 5, 2, 6, 7, 8]
var sum = 0

for number in arrayOfNumbers {
    print(number)
    sum += number
}

print(sum)


for number in 1..<10 { // this ignores 10 - 1...10 would do 1 to 10 // Note: No SPACES. and 2 dots if you use < or >, three if you want exact range
    print(number)
}


for number in 1...10 where number % 2 == 0 {
    print(number)
}


// === Beer Song ===

// Within func argument calls, you can define internal parameters (to the function) and external parameter calls
func beerSong(numOfBottles totalNumOfBottles: Int) -> String {
    var lyrics: String = ""
    for number in (1...totalNumOfBottles).reversed() {
        let newLine: String = "\n\(number) bottles of beer on the wall, \(number) bottles of beer. \nTake one down and pass it around, \(number-1) bottles of beer left standing on the wall"
        lyrics += newLine
    }
    lyrics += "\nNo more bottles of beer left standing on the wall, no more bottles of beer left standing on the wall. \n Go to the store and buy some more!"
    return lyrics
}

print(beerSong(numOfBottles: 6))
// Here, numOfBottles is used as the external parameter, with totalNumOfBottles being the internal parameter

// An alternative is to use an _ for the external parameter, to define that fact that you don't need to specify it in the function call, it would look like the below
func beerSongForThisManyBottlesOfBeer(_ totalBottles: Int) -> String{
    // Insert code here ie
    let modifiedBottles = totalBottles + 1
    // More code
    return "Modified Bottles equals \(modifiedBottles)"
}

print(beerSongForThisManyBottlesOfBeer(5))

// === End of Beer Song ===
// === Fibonaaci ===

func fibonacci(_ num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(num-1) + fibonacci(num-2)
    }
    
}

print(fibonacci(6))
// === End of Fib ===
