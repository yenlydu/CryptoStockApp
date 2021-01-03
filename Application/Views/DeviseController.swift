//
//  DeviseController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 21/12/2020.
//

import UIKit

class DeviseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    var dataArray: Array<String> = []
    @IBOutlet var devisePickerView: UIPickerView!
    @IBOutlet var changeDevise: UIButton!
    var devise : String = ""

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func changeLanguageButton(_ sender: Any) {
//        let str : String = self.selectedLanguage?[1] ?? self.presenter.getDefaultLanguage()
//        UserDefaults.standard.set(dataArray, forKey: "Devise")
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
        self.navigationController?.popToRootViewController(animated: true)
        print("devise", self.devise)
        UserDefaults.standard.set(self.devise, forKey: "Currency")
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)

    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.devise = self.dataArray[row]
        print ("test" + self.dataArray[row])
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataArray.count
    }

    func setDatas() {
        dataArray.append("$")
        dataArray.append("€")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setDatas()
        devisePickerView.delegate = self
        devisePickerView.dataSource = self
    }
}
