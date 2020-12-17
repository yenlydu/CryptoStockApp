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

    init(with view : ChangeLanguagePresenterView) {
        self.view = view
    }
    
    func displayLanguage () {
        view?.changeLanguages()
//        view?.changeLayout(languages: Languages(english: "English".localized(), french: "French".localized(), dutch: "Dutch".localized()) )
    }

}

protocol ChangeLanguagePresenterView: AnyObject {
    func changeLanguages() 
//    func changeLayout(languages : Languages)
}

extension ChangeLanguageViewController: ChangeLanguagePresenterView {
    func changeLanguages() {
//        var selection = ""
//        print(selection.isEmpty)
//        if (selection.isEmpty) {
//            print("enter")
//            selection = pickerData[0]
//            print("test",selection)
//        }
//        let splits = "French".localized().components(separatedBy: ",")
//        print(splits)
    //        var firstName: String = fullNameArr[0]

        print(Locale.current.languageCode)
    }
}
