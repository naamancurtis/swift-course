//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Naaman Curtis on 15/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (firstNumber: Double, operation: String)?
    
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumberCalculation(n2: n)
            default:
                self.intermediateCalculation = (firstNumber: n, operation: symbol)
            }
        }
        return nil
    }
    
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.firstNumber,
            let operation = intermediateCalculation?.operation {
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
