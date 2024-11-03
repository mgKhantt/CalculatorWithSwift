//
//  ViewController.swift
//  Calculator
//
//  Created by Khant Phone Naing  on 03/11/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var displayLabel: UILabel!
    
    var currentNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var currentOperation:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
    }

    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let numberText = sender.titleLabel?.text {
            currentNumber += numberText
            displayLabel.text = currentNumber
        }
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if let operation = sender.titleLabel?.text {
            firstOperand = currentNumber
            currentNumber = ""
            currentOperation = operation
        }
    }
    
    
    @IBAction func equalPressed(_ sender: UIButton) {
        secondOperand = currentNumber
        
        guard let firstValue = Double(firstOperand), let secondValue = Double(secondOperand), let operation = currentOperation else {
                return
            }
        
        var result : Double = 0
        
        switch operation {
        case "+":
            result = firstValue + secondValue
        case "-":
            result = firstValue - secondValue
        case "×":
            result = firstValue * secondValue
        case "÷":
            result = secondValue != 0 ? firstValue / secondValue : 0
        default:
            break
        }
        
        displayLabel.text = String(result)
        currentNumber = ""
        firstOperand = ""
        secondOperand = ""
        currentOperation = nil
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        currentNumber = ""
        firstOperand = ""
        secondOperand = ""
        currentOperation = nil
        displayLabel.text = "0"
    }
    
}

