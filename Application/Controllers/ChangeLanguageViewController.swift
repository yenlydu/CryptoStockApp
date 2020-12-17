//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit

class ChangeLanguageViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var selectedLanguage: String?
    let pickerData:Array = ["French", "English", "Netherlands"]
    var variable: String = ""
    var selection = ""
    var selected: String {
        return UserDefaults.standard.string(forKey: "selected") ?? ""
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = pickerData[row]

        print ("--")
        print ("ligne : ", row)
        print ("colonne : ", component)
        print ("Fruit : ", selection)
    }
    
    @IBOutlet var parametersView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        parametersView.dataSource = self
        parametersView.delegate = self
        title = "Parameters".localized()

        print(selection.isEmpty)
        if (selection.isEmpty) {
            print("enter")
            selection = pickerData[0]
            print("test",selection)
        }
        let splits = "French".localized().components(separatedBy: ",")
        print(splits)
//        var firstName: String = fullNameArr[0]

        print(Locale.current.languageCode)

     }
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        UserDefaults.standard.set(pickerData[row], forKey: "selected")
//    }
}
