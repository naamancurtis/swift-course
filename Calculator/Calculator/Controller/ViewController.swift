//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Error converting display label to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    private var calculator = CalculatorLogic()
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypingNumber = true

        calculator.setNumber(displayValue)
        if let calculationMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calculationMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    if floor(displayValue) != displayValue || displayLabel.text!.last == "." {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    
    }

}

