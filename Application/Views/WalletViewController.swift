//
//  WalletTempController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 26/12/2020.
//

import UIKit
import Charts

class WalletBoughtViewController: UIViewController, CachingData {
    @IBOutlet private var devise: UILabel!
    @IBOutlet private var lastBoughtUpdate: UILabel!
    @IBOutlet private var label: UILabel!
    @IBOutlet private var lastSoldUpdate: UILabel!
    private lazy var presenter = WalletPresenter(with: self)
    var cryptoClickedInformations : [String] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.labelSetText()
    }
}

extension WalletBoughtViewController : WalletView {
    func labelSetText(tokenBought: [String], tokenSold: [String]) {
        let amount = "Amount".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
        let currency = UserDefaults.standard.string(forKey: "Currency")!

        label.text = cryptoClickedInformations[0] + " " + amount + ": " + String(cryptoClickedInformations[1]) + currency
        if (UserDefaults.standard.string(forKey: "Languages") ?? Locale.current.languageCode == "en") {
            lastSoldUpdate.text = "LastSold".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Last Time Sold") + tokenSold[1]
            lastBoughtUpdate.text = "LastBought".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Last Time Bought") + tokenBought[1]
        } else {
            lastSoldUpdate.text = "LastSold".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Last Time Sold") + tokenSold[0]
            lastBoughtUpdate.text = "LastBought".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Last Time Bought") + tokenBought[0]
        }
    }

    func setDateBought() -> [String] {
        let transactionBoughtDate = getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>
        var tokenBought: [String] = ["Never", "Never"]

        if (transactionBoughtDate![cryptoClickedInformations[0]]! != "Never") {
            tokenBought = transactionBoughtDate![cryptoClickedInformations[0]]!.components(separatedBy: "|")
        } else {
            tokenBought[0] = "Never".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Never")
            tokenBought[1] = "Never".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Never")
        }
        return tokenBought
    }

    func setDateSold() -> [String] {
        let transactionSoldDate = getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
        var tokenSold: [String] = ["Never", "Never"]

        if (transactionSoldDate![cryptoClickedInformations[0]]! != "Never") {
            tokenSold = transactionSoldDate![cryptoClickedInformations[0]]!.components(separatedBy: "|")
        } else {
            tokenSold[0] = "Never".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Never")
            tokenSold[1] = "Never".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Never")
        }
        return tokenSold
    }
}
