//
//  WalletViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 23/12/2020.
//

import UIKit

class WalletViewController: UIViewController, CachingData {
    @IBOutlet weak var lastSoldUpdate: UILabel!
    @IBOutlet weak var lastBoughtUpdate: UILabel!
    @IBOutlet var amount: UILabel!
    var cryptoClicked : String = ""
    lazy var presenter = WalletPresenter(with: self)

    override func viewDidLoad() {
        super.viewDidLoad()
//        let wallet = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        self.presenter.saveDatas()
    }
}
