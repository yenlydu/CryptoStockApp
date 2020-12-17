//
//  ParametersViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class ParametersViewPresenter {
    var view: ParametersView?
    
    init(with view : ParametersView) {
        self.view = view
    }
    
    func setLabels() {
        self.view?.setLabels()
    }
    
}

protocol ParametersView : AnyObject{
    func setLabels()
}

extension ParametersViewController: ParametersView {
    func setLabels() {
        labelCountry.text = "Country".localized()
        labelCurrency.text = "ChangeCurrency".localized()
    }
}
