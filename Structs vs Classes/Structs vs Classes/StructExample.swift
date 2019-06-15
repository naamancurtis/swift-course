//
//  StructExample.swift
//  Structs vs Classes
//
//  Created by Naaman Curtis on 15/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import Foundation

struct Structhero {
    var name: String
    var universe: String
    
    // If you initialise the struct as a constant, and call this method, it would be fine
    func reverseName() -> String {
        return String(self.name.reversed())
    }
    
    // By default, structs are immutable. Therefore if you want to mutate anything within a struct, you need to mark it with a keyword "mutating"
    // This will create a new instance of the struct with the mutated effedt
    mutating func reverseNameSideEffect() {
        self.name = String(self.name.reversed())
    }
}
