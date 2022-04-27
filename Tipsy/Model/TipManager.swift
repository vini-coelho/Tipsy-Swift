//
//  TipManager.swift
//  Tipsy
//
//  Created by Vinicius Coelho on 27/04/22.
//

import Foundation

struct TipManager {
    var tip = 0.1
    var numberOfPeople = 2
    var result: String = ""
    
    mutating func setTipDecimal(percentageText: String) {
        tip = Double(String(percentageText.dropLast()))!/100
    }
    
    func getTipPercentageText() -> String {
        return String(format: "%d%%", Int(tip * 100))
    }
    
    mutating func calculateTip(tipValue: String) {
        if let bill = Double(tipValue) {
            let resultValue = (bill * (1 + tip)) / Double(numberOfPeople)
            result = String(format: "%.2f", resultValue)
        }
    }
}
