//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit

class ChangeLanguageViewController : UIViewController {
    var selectedLanguage: String?
    lazy var presenter = LanguagePresenter(with: self)
//    let pickerData:Array = ["French", "English", "Netherlands"]
//    var selected: String {
//        return UserDefaults.standard.string(forKey: "selected") ?? ""
//    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return pickerData.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerData[row]
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        selection = pickerData[row]
//
//        print ("--")
//        print ("ligne : ", row)
//        print ("colonne : ", component)
//        print ("Fruit : ", selection)
//    }
    
    @IBOutlet var parametersView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        parametersView.dataSource = self
//        parametersView.delegate = self
        title = "Parameters".localized()
        presenter.displayLanguage()
     }
    
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        UserDefaults.standard.set(pickerData[row], forKey: "selected")
//    }
}

