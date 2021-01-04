//
//  CalculatorViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 19/12/2020.
//

import UIKit

class CalculatorViewController: UIViewController, CachingData {
    @IBOutlet private weak var amountTextField: UILabel!
    @IBOutlet private var devise: UILabel!
    @IBOutlet private var sellTitle: UITextField!
    @IBOutlet private var buyTitle: UITextField!
    private var storyboardId: String = ""
    private lazy var presenter = CalculatorPresenter(with: self)
    var cellClicked: String = ""
    var frFormatter = DateFormatter()
    var enFormatter = DateFormatter()

    @IBOutlet var purchase: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        amountTextField.text = ""
        presenter.changeAppearance()
        presenter.purchaseSaleButton()
//        print ("prufr ", "Purchase".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!))
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        (frFormatter, enFormatter) = dateFormat()
    }

    private func dateFormat() -> (frDateFormatter: DateFormatter, enDateFormatter: DateFormatter) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, HH:mm:ss"
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MM/dd/yyyy, h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return (dateFormatter, formatter)
    }

    @IBAction func doneButton(_ sender: Any) {
        presenter.changeWalletAmount(amount: amountTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func buttonRm(_ sender: Any) {
        let string = amountTextField.text?.dropLast()
        amountTextField.text = String(string!)
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


extension CalculatorViewController : CalculatorView {
    func setStoryboardId() {
        storyboardId = restorationIdentifier!
        setTitle()
    }

    func setTitle() {
        devise.text = UserDefaults.standard.string(forKey: "Currency") ?? ""
        if (storyboardId == "Buy") {
            buyTitle.text = "Buy".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Buy")
            buyTitle.backgroundColor = .lightGray
        } else if (storyboardId == "Sell") {
            sellTitle.text = "Sell".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Sell")
            sellTitle.backgroundColor = .lightGray
        }
    }
    
    func setPurchaseName() {
        
    }
    
    func purchaseSaleButton() {
        if (storyboardId == "Buy") {
            purchase.title = "Purchase".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
        } else if (storyboardId == "Sell") {
            purchase.title = "Sale".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)

        }
    }

    func changeAppearance() {
        let myColor = UIColor.blue
        amountTextField.isUserInteractionEnabled = false
        amountTextField.layer.cornerRadius = 5.0
        amountTextField.layer.borderColor = myColor.cgColor
        amountTextField.layer.borderColor = view.tintColor.cgColor
        amountTextField.layer.borderWidth = 1.0
        amountTextField.textColor = .black
    }


    func changeWalletAmount(amount: Double) {
        var wallet = getObject(fileName: "myWallet") as? Dictionary<String, Double>
        var bought = getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>
        var sold = getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
    
//        let frDateFormatter = dateFormat().frDateFormatter
//        let enDateString = dateFormat().enDateFormatter

        if storyboardId == "Buy" {
            wallet?[cellClicked]! += Double(amount)
            bought?[cellClicked] = frFormatter.string(from: Date()) + "|" + enFormatter.string(from: Date())
            print ("format", frFormatter.string(from: Date()) + "|" + enFormatter.string(from: Date()))
            _ = saveObject(fileName: "transactionBoughtDate", object: bought!)
            _ = saveObject(fileName: "myWallet", object: wallet!)
            
        } else if storyboardId == "Sell" {
            wallet?[cellClicked]! -= Double(amount)
            sold?[cellClicked] = frFormatter.string(from: Date()) + "|" + enFormatter.string(from: Date())
            _ = saveObject(fileName: "myWallet", object: wallet!)
            _ = saveObject(fileName: "transactionSoldDate", object: sold!)
        }
    }
}
