//
//  CryptoInformationsController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 01/12/2020.
//

import UIKit

class CryptoInformationsViewController: UIViewController, CachingData {

    @IBOutlet weak var bitcoinInformation: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    lazy var presenter = CyptocurrencyInformationPresenter(with: self)
    var cellClicked: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        bitcoinInformation.font = bitcoinInformation.font.withSize(20)

        self.presenter.setInformations(tempCellClickedName: cellClicked)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BuyAmountIdentifier" {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! CalculatorViewController
            vc.cryptoName = cellClicked
        } else if segue.identifier == "SellAmountIdentifier" {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! CalculatorViewController

            vc.cryptoName = cellClicked
        }
    }
}