//
//  CryptoInformationsController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 01/12/2020.
//

import UIKit

class CryptoInformations: UIViewController {

    @IBOutlet private weak var bitcoinInformation: UILabel!
    @IBOutlet private weak var aboutLabel: UILabel!
    @IBOutlet private weak var buyButton: UIButton!
    @IBOutlet private weak var sellButton: UIButton!
    var cellClicked: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("crypto = " + cellClicked)
        self.setBitcoinInformation()
    }

    func setBitcoinInformation() {
        let tempAboutCellClicked = "About." + cellClicked.replacingOccurrences(of: " ", with: "")
        bitcoinInformation.text = tempAboutCellClicked.localized()
        aboutLabel.text = "About".localized() + " " + cellClicked
        bitcoinInformation.sizeToFit()
        bitcoinInformation.adjustsFontSizeToFitWidth = true
        bitcoinInformation.minimumScaleFactor = 0.5
        bitcoinInformation.numberOfLines = 0
        aboutLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
    }

}
