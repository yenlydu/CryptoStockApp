//
//  CalculatorPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 19/12/2020.
//

import UIKit

class CalculatorPresenter : CachingData{
    var view : CalculatorView?
    
    init(with view: CalculatorView) {
        self.view = view
        self.setStoryboardId()
    }
    
    func changeAppearance() {
        self.view?.changeAppearance()
    }

    func setStoryboardId () {
        view?.setStoryboardId()
    }
    
    func changeWalletAmount(amount: String) {
        self.view?.changeWalletAmount(amount:Double(amount) ?? 0)
    }
}

protocol CalculatorView {
    func changeAppearance()
    func changeWalletAmount(amount: Double)
    func setStoryboardId()
    func setTitle()
}

extension CalculatorViewController : CalculatorView {
    func setStoryboardId() {
        self.storyboardId = self.restorationIdentifier!
        self.setTitle()
    }

    func setTitle() {
        if (self.storyboardId == "Buy") {
            self.buyTitle.text = "Buy".localized()
            self.buyTitle.backgroundColor = .lightGray
        } else if (self.storyboardId == "Sell") {
            self.sellTitle.text = "Sell".localized()
            self.sellTitle.backgroundColor = .lightGray
        }
    }
    func changeAppearance() {
        let myColor = UIColor.blue
        self.amountTextField.isUserInteractionEnabled = false
        self.amountTextField.layer.cornerRadius = 5.0
        self.amountTextField.layer.borderColor = myColor.cgColor
        self.amountTextField.layer.borderColor = self.view.tintColor.cgColor
        self.amountTextField.layer.borderWidth = 1.0
        self.amountTextField.textColor = .black
    }
    func changeWalletAmount(amount: Double) {
        var wallet = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        var bought = self.getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>
        var sold = self.getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
        
        let date : Date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy, HH:mm:ss"
        let frnlDate = dateFormatter.string(from: date)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "MM/dd/yyyy, h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let dateString = formatter.string(from: Date())

        if self.storyboardId == "Buy" {
            wallet![self.cryptoName]! += Double(amount)

            bought![self.cryptoName] = frnlDate + "|" + dateString
            
            self.saveObject(fileName: "transactionBoughtDate", object: bought!) as? Dictionary<String, String>
            self.saveObject(fileName: "myWallet", object: wallet!)
            
        } else if self.storyboardId == "Sell" {
            wallet![self.cryptoName]! -= Double(amount)
            sold![self.cryptoName] = frnlDate + "|" + dateString

            self.saveObject(fileName: "myWallet", object: wallet!)
            self.saveObject(fileName: "transactionSoldDate", object: sold!)
        }
        for (key, value) in wallet! {
            print("key is - \(key) and value is - \(value)")
        }
    }
}
