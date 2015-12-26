//
//  ViewController.swift
//  Calculator
//
//  Created by Daniil Pendikov on 26/12/15.
//  Copyright © 2015 ltst. All rights reserved.
//

import UIKit

private let SCREEN_W:CGFloat = UIScreen.mainScreen().bounds.width
private let MARGIN:CGFloat = 10;
private let BTN_W:CGFloat = (SCREEN_W / 4) - MARGIN * 2
private let BTN_TAB:CGFloat = MARGIN * 2 + BTN_W
private let BTN_TAB_H:CGFloat = MARGIN + BTN_W
private let LABEL_H:CGFloat = 100
private let BTN_TOP_LINE:CGFloat = MARGIN + LABEL_H
//private let BTN_TOP_LINE:CGFloat = MARGIN + LABEL_H

//result on ViewController too ????

class ViewController: UIViewController {
    
    var calculator = Calculator();
    
    lazy var label: UILabel = {
        let v = UILabel(frame: CGRect(x: MARGIN, y: MARGIN, width: SCREEN_W-16, height: LABEL_H))
        v.text = "0"
        v.textAlignment = NSTextAlignment.Right
        return v
    }()
    
    
    lazy var button1: UIButton = {
        let v = UIButton(frame: CGRect(x: MARGIN, y: BTN_TOP_LINE, width: BTN_W, height: BTN_W))
        v.setTitle("1", forState: .Normal)
//        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        return v
    }()
    
    lazy var button2: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB + MARGIN), y: BTN_TOP_LINE, width: BTN_W, height: BTN_W))
        v.setTitle("2", forState: .Normal)
//        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button3: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: BTN_TOP_LINE, width: BTN_W, height: BTN_W))
        v.setTitle("3", forState: .Normal)
//        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button4: UIButton = {
        let v = UIButton(frame: CGRect(x: MARGIN, y: (BTN_TOP_LINE + BTN_TAB_H), width: BTN_W, height: BTN_W))
        v.setTitle("4", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        return v
    }()
    
    lazy var button5: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 1 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H), width: BTN_W, height: BTN_W))
        v.setTitle("5", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button6: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H), width: BTN_W, height: BTN_W))
        v.setTitle("6", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button7: UIButton = {
        let v = UIButton(frame: CGRect(x: MARGIN, y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("7", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button8: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 1 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("8", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button9: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("9", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var button0: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 1 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 3), width: BTN_W, height: BTN_W))
        v.setTitle("0", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var buttonPlus: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: BTN_TOP_LINE, width: BTN_W, height: BTN_W))
        v.setTitle("+", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var buttonMinus: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H), width: BTN_W, height: BTN_W))
        v.setTitle("-", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var buttonMulti: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("*", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var buttonDivision: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 3), width: BTN_W, height: BTN_W))
        v.setTitle("/", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    lazy var buttonResult: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 4), width: BTN_W, height: BTN_W))
        v.setTitle("=", forState: .Normal)
        //        v.setTitleColor(UIColor.blackColor(), forState: .Normal)
        v.addTarget(self, action: "viewNumber:", forControlEvents: .TouchUpInside)
        v.backgroundColor = UIColor.blueColor()
        //        v.background = UIColor().
        return v
    }()
    
    
    func viewNumber(b:UIButton) { // save user choise & calculate it then
        
        label.text = b.titleLabel?.text; //???
        calculator.calculate(12)
    }
    
    func setText(text:String) {
        label.text = "dsf"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculator.viewController = self
        view.addSubview(label)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
        view.addSubview(button6)
        view.addSubview(button7)
        view.addSubview(button8)
        view.addSubview(button9)
        view.addSubview(button0)
        view.addSubview(buttonPlus)
        view.addSubview(buttonMinus)
        view.addSubview(buttonMulti)
        view.addSubview(buttonDivision)
        view.addSubview(buttonResult)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

