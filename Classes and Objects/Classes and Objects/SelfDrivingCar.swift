//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Naaman Curtis on 04/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import Foundation

class SelfDrivingCar: Car {
    var destination: String? // This sets the property as optional
    
    override func drive() {
        print("Automated driver engaged")
        
//        if destination != nil {
//            print("Driving to \(destination!)") // The "!" forces swift to allow this variable through, even if it can't detect it's been set
//        } // Using "!" (force unwrapping) is generally considered lazy programming, Optional Binding is a better way of mitigating the risk that variables aren't assigned
        
        // Optional Binding - Swiftier way of doing things
        // Only when destination has a value a new constant will be created (userSetDestination) which will in turn be used to execute the code
        if let userSetDestination = destination {
            print("Driving to \(userSetDestination)") // No Force unwrap required
        }
    }
}
