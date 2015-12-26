//
//  Calculator.swift
//  Calculator
//
//  Created by Daniil Pendikov on 26/12/15.
//  Copyright © 2015 ltst. All rights reserved.
//

import Foundation

class Calculator {
    
    var viewController:ViewController?
    
    func calculate(buttonTag:Int) {
        //...
        
        if let v = viewController {
            v.setText("")
        }
        
        viewController?.setText("")
    }

}