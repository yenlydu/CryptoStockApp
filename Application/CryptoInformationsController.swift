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
        let tempAbout = "About." + cellClicked
        bitcoinInformation.text = tempAbout.localized()
        aboutLabel.text = "About".localized()
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
