import UIKit

/*
 ================================================================================
 ===                                 Notes                                    ===
 ================================================================================
 - UserDefaults are not a database
 - UserDefaults are a singleton
 - Your app has to load up the entire UserDefaults plist when it loads the app
    - This can have significant implications on your app performance and efficiency
 - Really they should only be used for minor "easy to grab" bits of information
    - Not large arrays or strings etc
 ================================================================================
*/

let defaults = UserDefaults.standard

// Note, if you're going to be calling using user defaults often, it's generally best to initialise the key in a constant, to then use variable throughout to remove chance of errors
let dictionaryKey = "myDictionary"

// === Examples of what you can set with User Defaults ===
defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Angela", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")

let array = [1, 2, 3, 4]
defaults.set(array, forKey: "myArray")

let dictionary = ["name": "Angela"]
defaults.set(dictionary, forKey: dictionaryKey)

// === Examples of how to grab these values to load them in the app ===
let volume = defaults.float(forKey: "volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")

let myArray = defaults.array(forKey: "myArray") as! [Int]

let myDictionary = defaults.dictionary(forKey: dictionaryKey) as! [String: String]
