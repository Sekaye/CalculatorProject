//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Written by Sekaye Knutson
//  Copyright © 2019 London App Brewery. All rights reserved.
//  Copyright © 2022 Sekaye Knutson. All rights reserved.
//
// Idea! Let users pick color themes for their calculator. The menu disappears once user input begins (e.g, all clear hasn't been pressed)

import UIKit

class ViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var displayLabel: UILabel!
    
    //Properties
    private var calculation = CalculationLogic()
    private var isFinishedTyping: Bool = true
    private var isDecimal = false
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!)
            else { fatalError("Cannot convert display label text to a Double")}
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    // Actions
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTyping = true
        isDecimal = false
        
        calculation.setNumber(displayValue)
        
        if let calcType = sender.currentTitle {
            if let result = calculation.calculate(calcType) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                displayLabel.text = numValue
                isFinishedTyping = false
            }
            else {
                switch numValue
                {
                case ".":
                    print(isDecimal)
                    if isDecimal { return }
                    switch displayLabel.text
                    {
                    case "0":
                        return
                    case ".":
                        return
                    default:
                        isDecimal = true
                    }
                    fallthrough
                    
                default:
                    displayLabel.text = displayLabel.text! + numValue
                }
            }
        }
    }
}

