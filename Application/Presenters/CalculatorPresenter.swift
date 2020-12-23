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
//        var value = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
//
//        for (key, value) in value! {
//            print("key is - \(key) and value is - \(value)")
//        }
        self.view?.changeWalletAmount(amount: Int(amount) ?? 0)
    }
}

protocol CalculatorView {
    func changeAppearance()
    func changeWalletAmount(amount: Int)
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
    func changeWalletAmount(amount: Int) {
        print("enter change wallet amount", self.storyboardId)
        var value = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        if self.storyboardId == "Buy" {
            value![self.cryptoName]! += Double(amount)
            self.saveObject(fileName: "myWallet", object: value!)
        } else if self.storyboardId == "Sell" {
            value![self.cryptoName]! -= Double(amount)
            self.saveObject(fileName: "myWallet", object: value!)

        }
        for (key, value) in value! {
            print("key is - \(key) and value is - \(value)")
        }
        print(self.storyboardId)
    }
}
