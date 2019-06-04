//
//  Car.swift
//  Classes and Objects
//
//  Created by Naaman Curtis on 03/06/2019.
//  Copyright © 2019 Naaman Curtis. All rights reserved.
//

import Foundation

class Car {
    var typeOfCar: CarType = .Coupe
    var color: String = "Black"
    var numberOfSeats: Int = 5
    
    init(){
    }
    
    convenience init(chosenColor: String) {
        self.init()
        color = chosenColor
    }
    
    func drive() -> Void {
        print("Car is moving")
    }
}

enum CarType {
    case Sedan
    case Coupe
    case Hatchback
}
