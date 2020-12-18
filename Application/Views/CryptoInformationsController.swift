//
//  CryptoInformationsController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 01/12/2020.
//

import UIKit

class CryptoInformationsViewController: UIViewController {

    @IBOutlet weak var bitcoinInformation: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    @IBOutlet weak var sellLabel: UILabel!
    @IBOutlet weak var buyLabel: UILabel!

    lazy var presenter = CyptocurrencyInformationPresenter(with: self)
    var cellClicked: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter.setInformations(tempCellClickedName: cellClicked)
    }

}
