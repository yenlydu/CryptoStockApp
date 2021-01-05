//
//  ChangeLanguagePresetner.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class LanguagePresenter {
    private weak var view: ChangeLanguagePresenterView?
    private var dataArray: Array<String> = []
    private var defaultKey : String = "fr"

    init(with view : ChangeLanguagePresenterView) {
        self.view = view
    }

    func getDefaultLanguage() -> String {
        return defaultKey
    }

    func splitLanguageLocalized() {
        dataArray.append("French".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "French"))
        dataArray.append("English".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "English"))
        dataArray.append("Dutch".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Dutch"))
    }

    func getLanguages() -> Array<String> {
        return dataArray
    }

    func display () {
        view?.setText()
        view?.buttonAppearance()
    }
}

protocol ChangeLanguagePresenterView: class {
    func buttonAppearance()
    func setText()
}

