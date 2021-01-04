//
//  WalletPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 04/01/2021.
//

import Foundation
import UIKit

class WalletPresenter {
    private weak var view: WalletView?
    
    init(with view: WalletView) {
        self.view = view
    }
    
    func setDateBought() -> [String] {
        return (view?.setDateBought())!
    }

    func setDateSold() -> [String] {
        return (view?.setDateSold())!
    }
    func labelSetText() {
        let tokenBought = setDateBought()
        let tokenSold = setDateSold()
        view?.labelSetText(tokenBought: tokenBought, tokenSold: tokenSold)
    }
    func setStyle(label: UILabel) {
        view?.setStyle(label: label)
    }
}

protocol WalletView : class {
    func labelSetText(tokenBought: [String], tokenSold: [String])
    func setDateBought() -> [String]
    func setDateSold() -> [String]
    func setStyle(label: UILabel)
}

