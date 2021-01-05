//
//  ParametersViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class ParametersPresenter {
    private weak var view: ParametersView?
    
    init(with view : ParametersView) {
        self.view = view
    }

    func setLabels() {
        view?.setLabels()
    }
}

protocol ParametersView : class {
    func setLabels()
}

extension ParametersViewController: ParametersView {
    func setLabels() {
        labelCountry.text = "Country".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Country")
        labelCurrency.text = "ChangeCurrencyPicker".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Currency")
    }
}
