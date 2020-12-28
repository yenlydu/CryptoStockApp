//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit

class ParametersViewController : UITableViewController {

    @IBOutlet var labelCountry: UILabel!
    @IBOutlet var labelCurrency: UILabel!
    lazy var presenter = ParametersPresenter(with: self)
    @IBOutlet var parametersTableView: UITableView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.presenter.setLabels()

    }
}
