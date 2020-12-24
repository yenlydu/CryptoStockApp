//
//  ChangeLanguagePresetner.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class LanguagePresenter {

    weak var view: ChangeLanguagePresenterView?
    @IBOutlet var parametersView: UIPickerView!
    var dataArray: Array<String> = []

    init(with view : ChangeLanguagePresenterView) {
        self.view = view
    }
    private func splitLanguageLocalized() {
        dataArray.append("French".localized())
        dataArray.append("English".localized())
        dataArray.append("Dutch".localized())
    }

    func getLanguages() -> Array<String> {
        return self.dataArray
    }
    
    func displayLanguage () {
        splitLanguageLocalized()
    }

}

protocol ChangeLanguagePresenterView: AnyObject {
}

extension ChangeLanguageViewController: ChangeLanguagePresenterView {
}
