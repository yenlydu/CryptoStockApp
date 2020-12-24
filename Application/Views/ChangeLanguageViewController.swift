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
    @IBOutlet var label: UILabel!
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
    
    @IBAction func buttonChange(_ sender: Any)
    {
//        let value = try? self.selectedLanguage?[0]
        changeLanguage(str: self.selectedLanguage![1])
        UserDefaults.standard.set(self.selectedLanguage![1], forKey: "Languages")
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }
    
    func changeLanguage(str:String) {
        label.text = "Sell".localizableString(str: str)
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.presenter.getLanguages().count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print (self.presenter.getLanguages()[row])
        self.selectedLanguage = self.presenter.getLanguages()[row].components(separatedBy: ",")
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.presenter.getLanguages()[row].components(separatedBy: ",")[0]
    }
    

}

extension String {
    func localizableString(str: String) -> String {
        let path = Bundle.main.path(forResource: str, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
