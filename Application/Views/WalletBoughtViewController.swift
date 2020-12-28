//
//  WalletTempController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 26/12/2020.
//

import UIKit
import Charts

class WalletBoughtViewController: UIViewController, CachingData {
    var cryptoClickedInformations : [String] = []

    @IBOutlet var devise: UILabel!
    @IBOutlet var lastBoughtUpdate: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var lastSoldUpdate: UILabel!

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        devise.text = "Currency".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
        let transactionBoughtDate = self.getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>
        let transactionSoldDate = self.getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>

        label.text = cryptoClickedInformations[0] + " amount : " + String(cryptoClickedInformations[1])
        
        var tokenBought: [String] = ["Never", "Never"]
        var tokenSold: [String] = ["Never", "Never"]
        
        if (transactionBoughtDate![cryptoClickedInformations[0]]! != "Never") {
            tokenBought = transactionBoughtDate![cryptoClickedInformations[0]]!.components(separatedBy: "|")
        }
        if (transactionSoldDate![cryptoClickedInformations[0]]! != "Never") {
            tokenSold = transactionSoldDate![cryptoClickedInformations[0]]!.components(separatedBy: "|")
        }

        if (Locale.current.languageCode == "en") {
            
            self.lastSoldUpdate.text = "LastSold".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!) + tokenSold[1]
            self.lastBoughtUpdate.text = "LastBought".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!) + tokenBought[1]
        } else {
            self.lastSoldUpdate.text = "LastSold".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!) + tokenSold[0]
            self.lastBoughtUpdate.text = "LastBought".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!) + tokenBought[0]
        }
    }
}
