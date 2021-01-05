//
//  DeviseController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 21/12/2020.
//

import UIKit

class DeviseViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet private var devisePickerView: UIPickerView!
    @IBOutlet private var changeDevise: UIButton!
    private var devise : String = ""
    private var dataArray: Array<String> = []
    private lazy var presenter = DevisePresenter(with: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        devisePickerView.delegate = self
        devisePickerView.dataSource = self
        presenter.setText()
        presenter.setDataDevises()
        buttonAppearance()
        
    }
    func buttonAppearance() {
        changeDevise.backgroundColor = .clear
        changeDevise.layer.cornerRadius = 5
        changeDevise.layer.borderWidth = 1
        changeDevise.layer.borderColor = UIColor.black.cgColor
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func changeDeviseButton(_ sender: Any) {
        presenter.doChangeDeviseButtonAction()
        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.devise = dataArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
}

extension DeviseViewController : DeviseView {
    func setDataDevises() {
        dataArray.append("$")
        dataArray.append("€")
    }

    func setText() {
        changeDevise.setTitle("ChangeCurrency".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Change currency"), for: .normal)
    }
    
    func doChangeDeviseButtonAction() {
        UserDefaults.standard.set(devise.isEmpty ? "$" : devise, forKey: "Currency")
        UIView.appearance().semanticContentAttribute = .forceLeftToRight
    }
}
