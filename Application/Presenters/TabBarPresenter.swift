//
//  TabBarPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit

class TabBarPresenter : CachingData {
    var view : TabBarView?
    private var json = JSONParser()
    private var jsonArray : [Cryptocurrency] = []

    init(with view: TabBarView) {
        self.view = view
        jsonArray = json.getInvestment()
    }
    func getJsonArray() -> [Cryptocurrency] {
        return self.jsonArray
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func saveTransactionSoldDate() {
        let date = self.getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
        
        let transactionDate = ["Bitcoin" : "Never", "Ethereum" : "Never", "Litecoin" : "Never", "Tether" : "Never", "Chainlink" : "Never", "Bitcoin Cash" : "Never", "Polkadot" : "Never", "Binance Coin" : "Never"]

        if case Optional<Any>.none = date {
            if self.saveObject(fileName:
                                "transactionSoldDate", object: transactionDate) {
                print("saved")
            } else {
                print("not saved")
            }
        }
        else {
            print("value is: \(date!)")
        }
    }
    func saveTransactionBoughtDate() {
        let date = self.getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>

        if case Optional<Any>.none = date {
            let transactionDate = ["Bitcoin" : "Never", "Ethereum" : "Never", "Litecoin" : "Never", "Tether" : "Never", "Chainlink" : "Never", "Bitcoin Cash" : "Never", "Polkadot" : "Never", "Binance Coin" : "Never"]

            _ = self.saveObject(fileName: "transactionBoughtDate", object: transactionDate)
        }
        else {
            print("value is: \(date!)")
        }
    }
    
    func saveWallet() {
        let value = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        if case Optional<Any>.none = value {
            let myWallet = ["Bitcoin" : Double(0), "Ethereum" : Double(0), "Litecoin" : Double(0), "Tether" : Double(0), "Chainlink" : Double(0), "Bitcoin Cash" : Double(0), "Polkadot" : Double(0), "Binance Coin" : Double(0)]
            _ = self.saveObject(fileName: "myWallet", object: myWallet)
        }
        else {
            print("value is: \(value!)")
        }
    }
    
    func setTitle() {
        self.saveTransactionSoldDate()
        self.saveTransactionBoughtDate()
        self.saveWallet()
        view?.setTitle()
     }
}

protocol TabBarView {
    func setTitle()
}

extension TabBarViewController : TabBarView {
    func setTitle() {
        let tabBarName : [String] = ["TabBarController.Prices", "TabBarController.Profile"]
        self.tabbar.items?.enumerated().forEach {
            index, item in
            UserDefaults.standard.set(Locale.current.languageCode, forKey: "Languages")

            item.title = tabBarName[index].localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
        }
    }
}
