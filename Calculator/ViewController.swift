
import UIKit

private let SCREEN_W:CGFloat = UIScreen.mainScreen().bounds.width
private let MARGIN:CGFloat = 10
private let BTN_W:CGFloat = (SCREEN_W / 4) - MARGIN * 2
private let LABEL_W:CGFloat = SCREEN_W - MARGIN * 2
private let BTN_RES_W:CGFloat = SCREEN_W / 2 - MARGIN * 2
private let BTN_CANCEL_W:CGFloat = SCREEN_W / 4 * 3 - MARGIN * 2
private let BTN_TAB:CGFloat = MARGIN * 2 + BTN_W
private let BTN_TAB_H:CGFloat = MARGIN + BTN_W
private let LABEL_H:CGFloat = 80
private let BTN_TOP_LINE:CGFloat = MARGIN * 3 + LABEL_H
private let BTN_COLOR = UIColor.blueColor()
private let BTN_OP_COLOR = UIColor.blueColor()
private let BTN_CANCEL_COLOR = UIColor.redColor()
private let BTN_RES_COLOR = UIColor.greenColor()
private let BTN_OP_TEXT_COLOR = UIColor.cyanColor()


class ViewController: UIViewController {
    
    var calculator = Calculator(); // culculate
    
    
 
    lazy var displayLabel: UILabel = {
        let v = UILabel(frame: CGRect(x: MARGIN, y: MARGIN * 2, width: LABEL_W, height: LABEL_H))
        v.text = "0"
        v.textAlignment = NSTextAlignment.Right
        v.layer.cornerRadius = 5
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.blackColor().CGColor
        v.font = UIFont.systemFontOfSize(30)
        return v
    }()
    
    lazy var button1: UIButton = {
        let v = UIButton(frame: CGRect(x: MARGIN, y: ( BTN_TOP_LINE + BTN_TAB_H * 1), width: BTN_W, height: BTN_W))
        v.setTitle("1", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        v.tag = 1
        return v
    }()
    
    lazy var button2: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB + MARGIN), y: ( BTN_TOP_LINE + BTN_TAB_H * 1), width: BTN_W, height: BTN_W))
        v.setTitle("2", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button3: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: ( BTN_TOP_LINE + BTN_TAB_H * 1), width: BTN_W, height: BTN_W))
        v.setTitle("3", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button4: UIButton = {
        let v = UIButton(frame: CGRect(x: MARGIN, y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("4", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button5: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 1 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("5", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button6: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("6", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button7: UIButton = {
        let v = UIButton(frame: CGRect(x: MARGIN, y: (BTN_TOP_LINE + BTN_TAB_H * 3), width: BTN_W, height: BTN_W))
        v.setTitle("7", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button8: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 1 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 3), width: BTN_W, height: BTN_W))
        v.setTitle("8", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button9: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 3), width: BTN_W, height: BTN_W))
        v.setTitle("9", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
    
    lazy var button0: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 1 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 4), width: BTN_W, height: BTN_W))
        v.setTitle("0", forState: .Normal)
        v.addTarget(self, action: "accumulate:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_COLOR
        return v
    }()
 //////////////////////////////////OP
    lazy var buttonPlus: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: BTN_TOP_LINE, width: BTN_W, height: BTN_W))
        v.setTitle("+", forState: .Normal)
        v.titleLabel?.textColor = BTN_OP_TEXT_COLOR
        v.addTarget(self, action: "chooseOperation:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_OP_COLOR
        return v
    }()
    
    lazy var buttonMinus: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H), width: BTN_W, height: BTN_W))
        v.setTitle("-", forState: .Normal)
        v.titleLabel?.textColor = BTN_OP_TEXT_COLOR
        v.addTarget(self, action: "chooseOperation:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_OP_COLOR
        return v
    }()
    
    lazy var buttonMulti: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 2), width: BTN_W, height: BTN_W))
        v.setTitle("×", forState: .Normal)
        v.titleLabel?.textColor = BTN_OP_TEXT_COLOR
        v.addTarget(self, action: "chooseOperation:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_OP_COLOR
        return v
    }()
    
    lazy var buttonDivision: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 3 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 3), width: BTN_W, height: BTN_W))
        v.setTitle("÷", forState: .Normal)
        v.titleLabel?.textColor = BTN_OP_TEXT_COLOR
        v.addTarget(self, action: "chooseOperation:", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_OP_COLOR
        return v
    }()
    
    lazy var buttonPoint: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 0 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 4), width: BTN_W, height: BTN_W))
        v.setTitle(",", forState: .Normal)
        v.addTarget(self, action: "decimalPoint", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_OP_COLOR
        return v
    }()
    
    lazy var buttonCancel: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 0 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 0), width: BTN_CANCEL_W, height: BTN_W))
        v.setTitle("clear", forState: .Normal)
        v.addTarget(self, action: "clear", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_CANCEL_COLOR
        return v
    }()
    
    lazy var buttonResult: UIButton = {
        let v = UIButton(frame: CGRect(x: (BTN_TAB * 2 + MARGIN), y: (BTN_TOP_LINE + BTN_TAB_H * 4), width: BTN_RES_W, height: BTN_W))
        v.setTitle("=", forState: .Normal)
        v.addTarget(self, action: "calculate", forControlEvents: .TouchUpInside)
        v.backgroundColor = BTN_RES_COLOR
        return v
    }()
    
    
    func accumulate(b:UIButton) {
        let text = b.titleLabel?.text
        calculator.accumulate(text!)
    }
 
    func decimalPoint() {
        calculator.decimalPoint()
    }
    
    func clear() {
        calculator.clear()
    }
 
    func calculate() {
        calculator.calculate()
    }
    
    func chooseOperation(b:UIButton) {
        let text = b.titleLabel?.text
        calculator.chooseOperation(text!)
    }
    
    func setText(text:String) {
        displayLabel.text = text
    }
    
    func getText()-> String {
        return displayLabel.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculator.viewController = self
        view.addSubview(displayLabel)
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
        view.addSubview(buttonPoint)
        view.addSubview(buttonCancel)
        view.addSubview(buttonResult)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

