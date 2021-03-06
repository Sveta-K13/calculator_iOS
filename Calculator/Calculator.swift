
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
    var isPositive = true
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
            let obj = NSNumberFormatter().numberFromString( displayText )
            if let _ = obj as? Double {
                return obj!.doubleValue
            }
            else {
                return 0.0
            }
            
        }
        set {
            displayText = newValue.formatted
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
//        if isFirstDigit {
//            isPositive = true
//        }
    }
    
    func decimalPoint() {
        if  !isDecimal {
            let sign: String = isPositive ? "" : "-"
            displayText = isFirstDigit ? sign + "0," : displayText + ","
            isFirstDigit = false
            isDecimal = true
    
        }
    }

    func sign() {
        if !isWaitOperand {
            let curNum = displayText.characters.split{$0 == "-"}.map(String.init)
            displayText = isPositive ? "-" + curNum[0] : curNum[0]
            isPositive = !isPositive
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
        isPositive = true
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
        isPositive = (displayValue >= 0)
    }

}