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

    func setTitle() {
        let value = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        if case Optional<Any>.none = value {
            let myWallet = ["Bitcoin" : Double(0), "Ethereum" : Double(0), "Litecoin" : Double(0), "Tether" : Double(0), "Chainlink" : Double(0), "Bitcoin Cash" : Double(0), "Polkadot" : Double(0), "Binance Coin" : Double(0)]

            if self.saveObject(fileName:
                                "myWallet", object: myWallet) {
                print("saved")
            } else {
                print("not saved")
            }
        } else {
            print("value is: \(value!)")
        }
        view?.setTitle()
     }
}

protocol TabBarView {
    func setTitle()
}

extension TabBarViewController : TabBarView {
    func setTitle() {
        let tabBarName : [String] = ["TabBarController.Home", "TabBarController.Prices", "TabBarController.Profile"]
        self.tabbar.items?.enumerated().forEach {
            index, item in
            item.title = tabBarName[index].localized()
        }
    }
}
