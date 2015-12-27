
import Foundation

class Calculator {
    
    var viewController:ViewController?
    
    var operation = "="
    var operand_1:Double = 0
    var isFirstDigit = true
    
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
            displayText = NSNumberFormatter().stringFromNumber(NSNumber(double:newValue))! // now show int
            isFirstDigit = true
            operation = "="
            
        }
    }

    func accumulate(digit:String) {
        
        displayText = isFirstDigit ? digit : displayText + digit
        if digit != "0" {
            isFirstDigit = false
        }

    }
    
    func chooseOperation(operation:String) {
        self.operation = "\(operation)"
        operand_1 = displayValue
        isFirstDigit = true
        
    }

    func clear() {
        displayValue = 0
    }
    
    func calculate() {
        switch operation {
        case "÷":displayValue = operand_1 / displayValue
        case "×":displayValue *= operand_1
        case "+":displayValue += operand_1
        case "-":displayValue = operand_1 - displayValue
        default:break
        }
    }

}