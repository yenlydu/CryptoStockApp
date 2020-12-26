//
//  WalletPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 24/12/2020.
//

import UIKit

class WalletPresenter {
    var view : WalletView?
    
    init(with view : WalletView) {
        self.view = view
    }
    
    func saveDatas() {
        self.view?.saveDate()
        self.view?.saveAmount()
    }
}

protocol WalletView {
    func saveDate ()
    func saveAmount()
}

extension WalletViewController : WalletView {
    func saveDate() {
        let wallet = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>

        self.amount.text = "Wallet: " + String(format: "%.2f", wallet![cryptoClicked]!)
    }
    
    func saveAmount() {
        let transactionSoldDate = self.getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
        let transactionBoughtDate = self.getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>
//        let wallet = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        
        var tokenBought: [String] = ["Never", "Never"]
        var tokenSold: [String] = ["Never", "Never"]
        
        if (transactionBoughtDate![cryptoClicked]! != "Never") {
            tokenBought = transactionBoughtDate![cryptoClicked]!.components(separatedBy: "|")
        }
        if (transactionSoldDate![cryptoClicked]! != "Never") {
            tokenSold = transactionSoldDate![cryptoClicked]!.components(separatedBy: "|")
        }

        if (Locale.current.languageCode == "en") {
            self.lastSoldUpdate.text = "LastSold".localized() + tokenSold[1]
            self.lastBoughtUpdate.text = "LastBought".localized() + tokenBought[1]
        } else {
            self.lastSoldUpdate.text = "LastSold".localized() + tokenSold[0]
            self.lastBoughtUpdate.text = "LastBought".localized() + tokenBought[0]
        }

    }
}
