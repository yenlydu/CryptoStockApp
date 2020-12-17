//
//  MoneyViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation
import UIKit
//import <#module#>
class MoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var tableView: UITableView!
    var json = JSONParser()
    var cellClicked : String = "nil"
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

//        print("click = " + clickedString)
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
//
//    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
////        print(jsonArray[indexPath.row].name)
//        clickedString = jsonArray[indexPath.row].name
//
//    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        cellClicked = jsonArray[indexPath.row].name
        performSegue(withIdentifier: "displayCryptoInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsonArray.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayCryptoInfo" {

            let vc = segue.destination as! CryptoInformations
            vc.cellClicked = cellClicked //setting the titleString created from my ToDoListDetailViewController and setting it to contentTitle

        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.imageView?.image = UIImage(named: jsonArray[indexPath.row].icon)

        cell?.textLabel?.text = jsonArray[indexPath.row].name
        cell?.detailTextLabel?.text = jsonArray[indexPath.row].symbol
        cell?.tag = indexPath.row

        return cell!
    }
    
    
}
