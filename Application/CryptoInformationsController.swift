//
//  CryptoInformationsController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 01/12/2020.
//

import UIKit

class CryptoInformations: UIViewController {

    @IBOutlet var bitcoinInformation: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    var cellClicked: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("crypto = " + cellClicked)
        let tempAboutCellClicked = "About." + cellClicked.replacingOccurrences(of: " ", with: "")
//        let formattedString = cellClicked.replacingOccurrences(of: " ", with: "")
//        print(formattedString)
        bitcoinInformation.text = tempAboutCellClicked.localized()
        aboutLabel.text = "About".localized() + " " + cellClicked
        bitcoinInformation.sizeToFit()
        bitcoinInformation.adjustsFontSizeToFitWidth = true
        bitcoinInformation.minimumScaleFactor = 0.5
        bitcoinInformation.numberOfLines = 0
        aboutLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
//        print(cellClicked)
        // Do any additional setup after loading the view.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
