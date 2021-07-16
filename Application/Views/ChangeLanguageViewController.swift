//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit
import Charts
import Firebase

class ChangeLanguageViewController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet private var parametersView: UIPickerView!
    @IBOutlet private var buttonSetLanguage: UIButton!
    private lazy var presenter = LanguagePresenter(with: self)
    private var selectedLanguage: [String]?

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        parametersView.dataSource = self
        parametersView.delegate = self
        presenter.display()
        presenter.splitLanguageLocalized()
    }

    @IBAction func buttonChange(_ sender: Any) {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
          AnalyticsParameterItemID: AnalyticsEventSelectContent,
          AnalyticsParameterItemName: "sold",
          AnalyticsParameterContentType: "soldContent"
        ])

        let str : String = selectedLanguage?[1] ?? presenter.getDefaultLanguage()
        UserDefaults.standard.set(str, forKey: "Languages")
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        navigationController?.popToRootViewController(animated: true)
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.getLanguages().count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLanguage = presenter.getLanguages()[row].components(separatedBy: ",")
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return presenter.getLanguages()[row].components(separatedBy: ",")[0]
    }
}

extension ChangeLanguageViewController: ChangeLanguagePresenterView {
    func buttonAppearance() {
        buttonSetLanguage.backgroundColor = .clear
        buttonSetLanguage.layer.cornerRadius = 5
        buttonSetLanguage.layer.borderWidth = 1
        buttonSetLanguage.layer.borderColor = UIColor.black.cgColor
    }
    
    func setText() {
        buttonSetLanguage.setTitle("ChangeLanguage".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Change language"), for: .normal)
    }
}
