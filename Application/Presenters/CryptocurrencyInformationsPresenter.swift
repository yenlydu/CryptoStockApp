//
//  CryptocurrencyInformationsPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit

class CyptocurrencyInformationPresenter {
    var view : CryptocurrencyView?
    var buyIdentifier : String = "BuyAmountIdentifier"
    var sellIdentifier : String = "SellAmountIdentifier"

    init(with view: CryptocurrencyView) {
        self.view = view
    }
    
    func setInformations(tempCellClickedName: String) {
        view?.setInformations(cellClickedName: tempCellClickedName)
    }
    
    func getBuyIdentifier() -> String {
        return self.buyIdentifier
    }

    func getSellIdentifier() -> String {
        return self.sellIdentifier
    }

    func sendDataToCalculator(segue: UIStoryboardSegue) {
    }
}

protocol CryptocurrencyView : AnyObject {
    func setInformations(cellClickedName: String)
}

extension CryptoInformationsViewController : CryptocurrencyView {
    func setInformations(cellClickedName: String) {
        let tempAboutCellClicked = "About." + cellClickedName.replacingOccurrences(of: " ", with: "")
        
        self.bitcoinInformation.text = tempAboutCellClicked.localized()
        self.bitcoinInformation.font = bitcoinInformation.font.withSize(20)
        self.bitcoinInformation.sizeToFit()
        self.bitcoinInformation.adjustsFontSizeToFitWidth = true
        self.bitcoinInformation.minimumScaleFactor = 0.5
        self.bitcoinInformation.numberOfLines = 0
        
        self.aboutLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        self.aboutLabel.text = "About".localized() + " " + cellClickedName
    }
}
