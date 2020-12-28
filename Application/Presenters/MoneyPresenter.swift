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
        view?.setTitle()
        view?.tableViewLayout()
    }
}
protocol MoneyView {
    func setTitle()
    func tableViewLayout()
}

extension MoneyViewController : MoneyView {
    func setTitle() {
        title = "TabBarController.Prices".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
    }
    func tableViewLayout() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 160

    }
}
