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
    var gravity: String?
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


    @IBOutlet var parametersView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        parametersView.dataSource = self
        parametersView.delegate = self
        print("enter")
        title = "Parameters".localized()
        print(gravity)
        if let row = pickerData.firstIndex(of: selected) {
            print(parametersView.selectRow(row, inComponent: 0, animated: false))
         }
     }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UserDefaults.standard.set(pickerData[row], forKey: "selected")
    }
}
