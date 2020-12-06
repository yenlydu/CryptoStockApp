//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class HomeViewController: UIViewController {
    let goals = [6, 8, 26, 30, 8, 10]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "welcomeTitle".localized()
    }
    func customizeChart(dataPoints: [String], values: [Double]) {
      // TO-DO: customize the chart here
    }
}
