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
        dataArray.append("French".localized().components(separatedBy: ",")[0])
        dataArray.append("English".localized().components(separatedBy: ",")[0])
        dataArray.append("Dutch".localized().components(separatedBy: ",")[0])
    }

    func getDataSize() -> Array<String> {
        return self.dataArray
    }
    
    func displayLanguage () {
        splitLanguageLocalized()
        print(dataArray)
        view?.addTitle()
    }

}

protocol ChangeLanguagePresenterView: AnyObject {
    func addTitle()
}

extension ChangeLanguageViewController: ChangeLanguagePresenterView {

    
    func addTitle() {
        
//        var selection = ""
//        print(selection.isEmpty)
//        if (selection.isEmpty) {
//            print("enter")
//            selection = pickerData[0]
//            print("test",selection)
//        }
//        let splits = "French".localized().components(separatedBy: ",")
//        print(splits)
//            var firstName: String = fullNameArr[0]

        print(Locale.current.languageCode)
    }
}
