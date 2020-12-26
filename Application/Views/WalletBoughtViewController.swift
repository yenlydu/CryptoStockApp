//
//  WalletTempController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 26/12/2020.
//

import UIKit
import Charts

class WalletBoughtViewController: UIViewController, CachingData {
//    var value : ChartDataEntry = ""
    var cryptoClickedInformations : [String] = []

    @IBOutlet var lastBoughtUpdate: UILabel!
    @IBOutlet var label: UILabel!
    @IBOutlet var lastSoldUpdate: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let transactionBoughtDate = self.getObject(fileName: "transactionBoughtDate") as? Dictionary<String, String>
        let transactionSoldDate = self.getObject(fileName: "transactionSoldDate") as? Dictionary<String, String>
//
        print (cryptoClickedInformations)
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
            self.lastSoldUpdate.text = "LastSold".localized() + tokenSold[1]
            self.lastBoughtUpdate.text = "LastBought".localized() + tokenBought[1]
        } else {
            self.lastSoldUpdate.text = "LastSold".localized() + tokenSold[0]
            self.lastBoughtUpdate.text = "LastBought".localized() + tokenBought[0]
        }

        
        
//        lastBoughtUpdate.text = transactionBoughtDate![cryptoClickedInformations[1]]
//        lastSoldUpdate.text = transactionSoldDate![cryptoClickedInformations[1]]

    }
}
