//
//  MoneyViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class MoneyPresenter : CachingData {
    private var json = JSONParser()
    private var view : MoneyView?
    private var jsonArray : [Cryptocurrency] = []

    init(with view: MoneyView) {
        self.view = view
        jsonArray = json.getInvestment()
    }

    func getJsonArrayName(indexRow: Int) -> String {
        return jsonArray[indexRow].name
    }
    func getJsonArrayIcon(indexRow: Int) -> String {
        return jsonArray[indexRow].icon
    }
    func getJsonArraySymbol(indexRow: Int) -> String {
        return jsonArray[indexRow].symbol
    }

    func getJsonArray() -> [Cryptocurrency] {
        return jsonArray
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
