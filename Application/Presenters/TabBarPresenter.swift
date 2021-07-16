//
//  TabBarPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit
import os

class TabBarPresenter : CachingData {
    private weak var view : TabBarView?
    private var json = JSONParser()
    private var jsonArray : [Cryptocurrency] = []

    init(with view: TabBarView) {
        self.view = view
    }

    func getJsonArray() -> [Cryptocurrency] {
        return jsonArray
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func saveTransactionSoldDate() {
        let date = getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
        let transactionDate = ["Bitcoin" : "Never", "Ethereum" : "Never", "Litecoin" : "Never", "Tether" : "Never", "Chainlink" : "Never", "Bitcoin Cash" : "Never", "Polkadot" : "Never", "Binance Coin" : "Never"]

        if case Optional<Any>.none = date {
            _ = saveObject(fileName: "transactionSoldDate", object: transactionDate)
        } else {
            os_log("Transactions Sold Dates are : \(date!)")
        }
    }

    func saveTransactionBoughtDate() {
        let date = getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>

        if case Optional<Any>.none = date {
            let transactionDate = ["Bitcoin" : "Never", "Ethereum" : "Never", "Litecoin" : "Never", "Tether" : "Never", "Chainlink" : "Never", "Bitcoin Cash" : "Never", "Polkadot" : "Never", "Binance Coin" : "Never"]

            _ = saveObject(fileName: "transactionBoughtDate", object: transactionDate)
        } else {
            os_log("Transactions Bought Dates content are : \(date!)")
        }
    }

    func saveWallet() {
        let value = getObject(fileName: "myWallet") as? Dictionary<String, Double>
        if case Optional<Any>.none = value {
            let myWallet = ["Bitcoin" : Double(0), "Ethereum" : Double(0), "Litecoin" : Double(00), "Tether" : Double(0), "Chainlink" : Double(0), "Bitcoin Cash" : Double(0), "Polkadot" : Double(0), "Binance Coin" : Double(0)]
            _ = saveObject(fileName: "myWallet", object: myWallet)
        } else {
            os_log("Wallet Amount content are : \(value!)")
        }
    }

    func setTitle() {
        jsonArray = json.getInvestment()
        saveTransactionSoldDate()
        saveTransactionBoughtDate()
        saveWallet()
        view?.setTitle()
     }
}

protocol TabBarView : AnyObject {
    func setTitle()
}

extension TabBarViewController : TabBarView {
    func setTitle() {
        let tabBarName : [String] = ["TabBarController.Prices", "TabBarController.Profile"]
        UserDefaults.standard.set("Currency".localizableString(str: Locale.current.languageCode!), forKey: "Currency")
        UserDefaults.standard.set(Locale.current.languageCode, forKey: "Languages")
        tabbar.items?.enumerated().forEach {
            index, item in
            item.title = tabBarName[index].localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Nil")
        }
    }
}
