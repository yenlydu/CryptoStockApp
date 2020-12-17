//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit

class ChangeLanguageViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var selectedLanguage: String?
//    var selection: String = ""
    @IBOutlet var parametersView: UIPickerView!

    lazy var presenter = LanguagePresenter(with: self)


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.getDataSize().count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.presenter.getDataSize()[row]
    }

//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        selection = self.presenter.getDataSize()[row]
//        print ("--")
//        print ("ligne : ", row)
//        print ("colonne : ", component)
//        print ("Fruit : ", selection)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parametersView.dataSource = self
        parametersView.delegate = self
        self.presenter.displayLanguage()
     }
}
