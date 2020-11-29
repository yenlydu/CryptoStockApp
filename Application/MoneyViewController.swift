//
//  MoneyViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation
import UIKit

class MoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    // your data
    var dummyData = ["data 0","data 1","data 2"]
    var json = JSONParser()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cryptocurrency"
        tableView.delegate = self
        tableView.dataSource = self
        json.getInvestment()
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Bitcoin"

        return cell
    }
}


