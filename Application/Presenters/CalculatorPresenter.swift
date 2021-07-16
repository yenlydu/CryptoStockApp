//
//  CalculatorPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 19/12/2020.
//

import UIKit

class CalculatorPresenter : CachingData{
    private weak var view : CalculatorView?

    init(with view: CalculatorView) {
        self.view = view
        setStoryboardId()
    }

    func changeAppearance() {
        view?.changeAppearance()
    }

    func setStoryboardId () {
        view?.setStoryboardId()
    }

    func purchaseSaleButton() {
        view?.purchaseSaleButton()
    }

    func changeWalletAmount(amount: String) {
        view?.changeWalletAmount(amount:Double(amount) ?? 0)
    }
}

protocol CalculatorView : AnyObject {
    func changeAppearance()
    func changeWalletAmount(amount: Double)
    func setStoryboardId()
    func setTitle()
    func purchaseSaleButton()
}
