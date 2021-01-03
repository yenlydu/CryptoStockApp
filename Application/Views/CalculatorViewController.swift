//
//  CalculatorViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 19/12/2020.
//

import UIKit

class CalculatorViewController: UIViewController, CachingData {
    @IBOutlet weak  var amountTextField: UILabel!
    @IBOutlet var devise: UILabel!
    @IBOutlet var sellTitle: UITextField!
    @IBOutlet var buyTitle: UITextField!
    lazy var presenter = CalculatorPresenter(with: self)
    var storyboardId: String = ""
    var cryptoName: String = ""
    @IBOutlet var buttonsCalculator: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.text = ""
        self.presenter.changeAppearance()
        devise.text = "Currency".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
    }

    @IBAction func doneButton(_ sender: Any) {
        self.presenter.changeWalletAmount(amount: amountTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func buttonRm(_ sender: Any) {
        let string = self.amountTextField.text?.dropLast()
        self.amountTextField.text = String(string!)
    }

    @IBAction func button0(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "0"
        
    }

    @IBAction func buttonDot(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "."
    }

    @IBAction func button9(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "9"
    }

    @IBAction func button8(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "8"
    }

    @IBAction func button7(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "7"
    }

    @IBAction func button6(_ sender: UIButton) {
        amountTextField.text = amountTextField.text! + "6"
    }

    @IBAction func button5(_ sender: UIButton) {
        amountTextField.text = amountTextField.text! + "5"
    }

    @IBAction func button4(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "4"
    }

    @IBAction func button3(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "3"
    }

    @IBAction func button2(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "2"
    }

    @IBAction func button1(_ sender: Any) {
        amountTextField.text = amountTextField.text! + "1"
    }
}
