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
    
    @IBOutlet var parametersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelCountry.text = "Country".localized()
        self.labelCurrency.text = "ChangeCurrency".localized()
     }
}
