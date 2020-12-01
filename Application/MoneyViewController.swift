//
//  MoneyViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation
import UIKit


struct CryptocurrenciesInformation {
    var name:String?
    var symbol:String?
    var euro:Double?
    var usd:Double?

    init(name: String, symbol: String, euro: Double, usd:Double) {
        self.name = name
        self.symbol = symbol
        self.euro = euro
        self.usd = usd
    }
}


class MoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    var json = JSONParser()
    var cryptocurrenciesArray = [CryptocurrenciesInformation]()
    
//    https://www.buybitcoinworldwide.com/france/
//    https://trading-education.com/what-are-the-5-most-popular-cryptocurrencies-in-the-usa
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cryptocurrency"
        tableView.delegate = self
        tableView.dataSource = self
        json.getInvestment()
        let bitcoin = CryptocurrenciesInformation(name: "Bitcoin", symbol: "BTC", euro: 16155.19, usd: 19324.50)
        let ethereum = CryptocurrenciesInformation(name: "Ethereum", symbol: "ETH", euro: 520.72, usd: 622.93)
        let litecoin = CryptocurrenciesInformation(name: "Litecoin", symbol: "LTC", euro: 72.90, usd: 87.21)
        let chainlink = CryptocurrenciesInformation(name: "Chainlink", symbol: "LINK", euro: 12.26, usd: 14.65)
        let xrp = CryptocurrenciesInformation(name: "XRP", symbol: "XRP", euro: 0.5450, usd: 0.6519)
        let bitcoinCash = CryptocurrenciesInformation(name: "Bitcoin Cash", symbol: "BCH", euro:257.77, usd: 308.32)
        cryptocurrenciesArray.append(bitcoin)
        cryptocurrenciesArray.append(ethereum)
        cryptocurrenciesArray.append(litecoin)
        cryptocurrenciesArray.append(chainlink)
        cryptocurrenciesArray.append(xrp)
        cryptocurrenciesArray.append(bitcoinCash)
        cryptocurrenciesArray.append(bitcoinCash)
        cryptocurrenciesArray.append(bitcoinCash)
        tableView.keyboardDismissMode = .onDrag
        
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableView.automaticDimension

        
        self.navigationController?.hidesBarsOnTap = true
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
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
//        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "cryptoInformations", sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptocurrenciesArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
//        cell.indexpaindexpathForCell = indexPath

        cell?.textLabel?.text = cryptocurrenciesArray[indexPath.row].name
        cell?.detailTextLabel?.text = cryptocurrenciesArray[indexPath.row].symbol
//        self.performsActionsWhilePresentingModally.
//        cell.selectionStyle = .none;
//        print(cell.setSelected(true, animated: true))

        cell?.tag = indexPath.row
        
        // call the subscribeTapped method when tapped


        return cell!
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
