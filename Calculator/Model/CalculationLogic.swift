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
    
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calculate(with calcType: String) -> Double? {
        
            switch calcType
            {
            case "+/-":
                return number * -1
            case "AC":
                return 0
            case "%":
                return number / 100.0
            default:
                print("Error performing function")
                return nil
            }
    }
}
