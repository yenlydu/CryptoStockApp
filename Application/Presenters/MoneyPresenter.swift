//
//  MoneyViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class MoneyPresenter : CachingData {
    var json = JSONParser()
    var jsonArray : [Cryptocurrency] = []


    var view : MoneyView?
    private var segueIdentifier : String = "displayCryptoInfo"
    private var cellIdentifier : String = "cell"

    init(with view: MoneyView) {
        self.view = view
        self.jsonArray = json.getInvestment()
    }
    
    func getSegueIdentifier() -> String {
        return self.segueIdentifier
    }
    
    func getCellIdentifier() -> String {
        return self.cellIdentifier
    }
    
    func getJsonArrayName(indexRow: Int) -> String {
        return self.jsonArray[indexRow].name
    }
    func getJsonArrayIcon(indexRow: Int) -> String {
        return self.jsonArray[indexRow].icon
    }
    func getJsonArraySymbol(indexRow: Int) -> String {
        return self.jsonArray[indexRow].symbol
    }

    func getJsonArray() -> [Cryptocurrency] {
        return self.jsonArray
    }

    func tableViewLayout() {
//        jsonArray = (self.getObject(fileName: "cryptocurrencies") as? [Cryptocurrency])!
        view?.setTitle()

        view?.tableViewLayout()
    }
    func configureCell(indexPath : Int) -> UITableViewCell {
        return configureCell(indexPath: indexPath)
    }
}
protocol MoneyView {
    func setTitle()
    func tableViewLayout()
//    func configureCell(indexPath: Int) -> UITableViewCell
}

extension MoneyViewController : MoneyView {
    func setTitle() {
        title = "TabBarController.Prices".localized()
    }
    func tableViewLayout() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 160

    }
//    func configureCell(indexPath : Int) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCell(withIdentifier: self.presenter.getCellIdentifier())
//        if cell == nil {
//            cell = UITableViewCell(style: .default, reuseIdentifier: self.presenter.getCellIdentifier())
//        }
//        cell?.imageView?.image = UIImage(named: self.presenter.getJsonArrayIcon(indexRow: indexPath))
//
//        cell?.textLabel?.text = self.presenter.getJsonArrayName(indexRow: indexPath)
//        cell?.detailTextLabel?.text = self.presenter.getJsonArraySymbol(indexRow: indexPath)
//        cell?.tag = indexPath
//        return cell!
//    }
}
