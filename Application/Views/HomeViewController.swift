//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var text: UITextField!
    @IBOutlet private weak var button: UIButton!
    
    var presenter = HomeViewPresenter(languages: Languages(english: "aze", french: "rty", dutch: "uio"))

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "welcomeTitle".localized()
    }
    func customizeChart(dataPoints: [String], values: [Double]) {
      // TO-DO: customize the chart here
    }
}
