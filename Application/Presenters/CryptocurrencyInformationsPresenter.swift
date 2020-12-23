//
//  CryptocurrencyInformationsPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit

class CyptocurrencyInformationPresenter {
    var view : CryptocurrencyView?
    init(with view: CryptocurrencyView) {
        self.view = view
    }
    func setInformations(tempCellClickedName: String) {
        view?.setInformations(cellClickedName: tempCellClickedName)
    }
}

protocol CryptocurrencyView : AnyObject {
    func setInformations(cellClickedName: String)
}

extension CryptoInformationsViewController : CryptocurrencyView {
    
    func setInformations(cellClickedName: String) {
        let tempAboutCellClicked = "About." + cellClickedName.replacingOccurrences(of: " ", with: "")
        self.bitcoinInformation.text = tempAboutCellClicked.localized()
        self.aboutLabel.text = "About".localized() + " " + cellClickedName
        self.bitcoinInformation.sizeToFit()
        self.bitcoinInformation.adjustsFontSizeToFitWidth = true
        self.bitcoinInformation.minimumScaleFactor = 0.5
        self.bitcoinInformation.numberOfLines = 0
        self.aboutLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
    }
}
