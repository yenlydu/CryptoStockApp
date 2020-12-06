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
    var json = JSONParser()
    var jsonArray : [Cryptocurrency] = []
//    var cryptocurrenciesArray = [CryptocurrenciesInformation]()
    var fetchingmore = false

//    https://www.buybitcoinworldwide.com/france/
//    https://trading-education.com/what-are-the-5-most-popular-cryptocurrencies-in-the-usa
    
    override func viewDidLoad() {
        title = "TabBarController.Prices".localized()
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160
        jsonArray = json.getInvestment()
        print(jsonArray)
//        tableView.reloadData()
  
    }
    
    
    func tableView(_ tempTableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tempTableView == tableView) {
            return 50
        }
        else if (tempTableView == tableView) {

            return UITableView.automaticDimension
        }

        return 0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "displayCryptoInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = jsonArray[indexPath.row].name
        cell?.detailTextLabel?.text = jsonArray[indexPath.row].symbol
        cell?.tag = indexPath.row

        return cell!
    }
    
    
}
