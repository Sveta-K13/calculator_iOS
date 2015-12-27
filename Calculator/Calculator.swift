
import Foundation

extension Double {
    var formatted:String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        formatter.minimumFractionDigits = 0
        //formatter.maximumFractionDigits = 2
        return formatter.stringFromNumber(self)!
    }
}

class Calculator {
    
    var viewController:ViewController?

    var operation = "="
    var operand_1:Double = 0
    var isFirstDigit = true
    var isDecimal = false
    var isWaitOperand = false
    
    var displayText: String {
        get {
            return (viewController?.getText())!
        }
        set {
            viewController?.setText(newValue)
        }
    
    }
    
    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString( displayText )!.doubleValue
        }
        set {
            displayText = newValue.formatted // now show int
            isFirstDigit = true
            operation = "="
            
        }
    }

    func accumulate(digit:String) {
        isWaitOperand = false
        displayText = isFirstDigit ? digit : displayText + digit
        if digit != "0" {
            isFirstDigit = false
        }
    }
    
    func decimalPoint() {
        if  !isDecimal {
            displayText = isFirstDigit ? "0," : displayText + ","
            isFirstDigit = false
            isDecimal = true
    
        }
    }


    
    func chooseOperation(operation:String) {
        isDecimal = false
        if !isWaitOperand {
            calculate()
        }
        self.operation = "\(operation)"
        operand_1 = displayValue
        isFirstDigit = true
        isWaitOperand = true
        
    }

    func clear() {
        displayValue = 0
    }
    
    func calculate() {
        isWaitOperand = false
        isDecimal = false
        switch operation {
        case "÷":displayValue = operand_1 / displayValue
        case "×":displayValue *= operand_1
        case "+":displayValue += operand_1
        case "-":displayValue = operand_1 - displayValue
        default:break
        }
    }

}