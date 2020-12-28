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
    var key : String = "Languages"
    var defaultKey : String = "fr"
    init(with view : ChangeLanguagePresenterView) {
        self.view = view
    }
    
    func getDefaultLanguage() -> String {
        return self.defaultKey
    }
    
    func getKey() -> String {
        return self.key
    }
    
    private func splitLanguageLocalized() {
        dataArray.append("French".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!))
        dataArray.append("English".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!))
        dataArray.append("Dutch".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!))
    }

    func getLanguages() -> Array<String> {
        return self.dataArray
    }
    
    func displayLanguage () {
        splitLanguageLocalized()
    }

}

protocol ChangeLanguagePresenterView: AnyObject {
    func splitLanguageLocalized()
}

extension ChangeLanguageViewController: ChangeLanguagePresenterView {
    func splitLanguageLocalized() {
        
    }

}
