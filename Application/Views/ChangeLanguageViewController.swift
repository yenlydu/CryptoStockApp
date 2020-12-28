//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit
import Charts

class ChangeLanguageViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var selectedLanguage: [String]?
    @IBOutlet var parametersView: UIPickerView!
    @IBOutlet var buttonChangeLanguage: UIButton!
    lazy var presenter = LanguagePresenter(with: self)

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parametersView.dataSource = self
        parametersView.delegate = self
        self.presenter.displayLanguage()
    }
    
    @IBAction func buttonChange(_ sender: Any) {
        let str : String = self.selectedLanguage?[1] ?? self.presenter.getDefaultLanguage()
        UserDefaults.standard.set(str, forKey: self.presenter.getKey())
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }
    

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.getLanguages().count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedLanguage = self.presenter.getLanguages()[row].components(separatedBy: ",")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.presenter.getLanguages()[row].components(separatedBy: ",")[0]
    }
}

