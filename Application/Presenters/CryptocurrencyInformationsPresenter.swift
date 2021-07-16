//
//  CryptocurrencyInformationsPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit
import Charts

class CyptocurrencyInformationPresenter {
    private weak var view : CryptocurrencyView?
    private var lineChartLabel: String = ""

    init(with view: CryptocurrencyView) {
        self.view = view
        let variations = "Variations".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Variations")
        let currency = UserDefaults.standard.string(forKey: "Currency") ?? ""
        lineChartLabel = variations + currency
    }

    func setInformations(tempCellClickedName: String) {
        view?.setInformations(cellClickedName: tempCellClickedName)
    }

    func getLineChartLabel() -> String {
        return lineChartLabel
    }

    func getLineChartDatas() -> [ChartDataEntry] {
        return (view?.getLineChartDatas())!
    }
}

protocol CryptocurrencyView : AnyObject {
    func setInformations(cellClickedName: String)
    func getCellClickedPosition() -> Int?
    func getLineChartDatas() -> [ChartDataEntry]
}
