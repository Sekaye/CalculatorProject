//
//  CalculationLogic.swift
//  Calculator
//
//  Created by Sekaye Knutson on 9/27/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//  Copyright © 2022 Sekaye Knutson. All rights reserved.
//

import UIKit

struct CalculationLogic {
    
    private var number: Double?
    
    private var intermediateCalc: (num1: Double, calculation: String)?
    
    mutating func setNumber(_ num: Double) {
        self.number = num
    }
    
    mutating func calculate(_ calcType: String) -> Double? {
        
        if let n = number {
            switch calcType
            {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n / 100.0
            case "=":
               return performOperation(n2: n)
            default:
                intermediateCalc = (num1: n, calculation: calcType)
                return nil
            }
        } else { return nil }
    }
    
    private func performOperation(n2: Double) -> Double? {
        if let n1 = intermediateCalc?.num1,
            let operation = intermediateCalc?.calculation
        // "If the number in intermediateCalc is not nil, and the calculation in intermediateCalc is not nil: THEN...
        {
            switch operation {
            case "÷":
                return n1 / n2
            case "×":
                return n1 * n2
            case "-":
                return n1 - n2
            case "+":
                return n1 + n2
            default:
                fatalError("Unknown operation")
                return nil
            }
        } else { return nil }
    }
}
