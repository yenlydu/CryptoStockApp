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
    private lazy var presenter = ParametersPresenter(with: self)
    @IBOutlet private var parametersTableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.setLabels()
    }
}
