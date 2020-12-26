//
//  CryptocurrencyInformationsPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit
import Charts

class CyptocurrencyInformationPresenter {
    var view : CryptocurrencyView?
    var buyIdentifier : String = "BuyAmountIdentifier"
    var sellIdentifier : String = "SellAmountIdentifier"
    var lineChartLabel: String = "Variations"
    
    init(with view: CryptocurrencyView) {
        self.view = view
    }
    
    func setInformations(tempCellClickedName: String) {
        view?.setInformations(cellClickedName: tempCellClickedName)
    }
    
    func getBuyIdentifier() -> String {
        return self.buyIdentifier
    }

    func getSellIdentifier() -> String {
        return self.sellIdentifier
    }
    
    func getLineChartLabel() -> String {
        return self.lineChartLabel
    }

    func setLineChar() {
        self.view?.getCellClickedPosition()
    }
    
    func getLineChartDatas() -> [ChartDataEntry] {
        return (self.view?.getLineChartDatas())!
    }
}

protocol CryptocurrencyView : AnyObject {
    func setInformations(cellClickedName: String)
    func getCellClickedPosition() -> Int?
    func getLineChartDatas() -> [ChartDataEntry]
}

extension CryptoInformationsViewController : CryptocurrencyView {
    func getLineChartDatas() -> [ChartDataEntry] {
        self.getCellClickedPosition()
        variations = jsonArray[self.getCellClickedPosition()!].variationsLastWeek
        var entries = [ChartDataEntry]()
        entries.append(ChartDataEntry(x: 1, y: Double(variations!.monday)))
        entries.append(ChartDataEntry(x: 2, y: Double(variations!.tuesday)))
        entries.append(ChartDataEntry(x: 3, y: Double(variations!.wednesday)))
        entries.append(ChartDataEntry(x: 4, y: Double(variations!.thursday)))
        entries.append(ChartDataEntry(x: 5, y: Double(variations!.friday)))
        entries.append(ChartDataEntry(x: 6, y: Double(variations!.saturday)))
        entries.append(ChartDataEntry(x: 7, y: Double(variations!.sunday)))
        return entries
    }
    
    func getCellClickedPosition() -> Int? {
        for i in 0..<jsonArray.count {
            if (cellClicked == jsonArray[i].name) {
                return i
            }
        }
        return nil
    }

    func setInformations(cellClickedName: String) {
        let tempAboutCellClicked = "About." + cellClickedName.replacingOccurrences(of: " ", with: "")
        
        self.bitcoinInformation.text = tempAboutCellClicked.localized()
        self.bitcoinInformation.font = bitcoinInformation.font.withSize(20)
        self.bitcoinInformation.sizeToFit()
        self.bitcoinInformation.adjustsFontSizeToFitWidth = true
        self.bitcoinInformation.minimumScaleFactor = 0.5
        self.bitcoinInformation.numberOfLines = 0
        
        self.aboutLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        self.aboutLabel.text = "About".localized() + " " + cellClickedName
        
        if (self.jsonArray[self.getCellClickedPosition()!].variationsPercentage.oneDay < 0) {
            self.priceOneDay.textColor = UIColor.red
        } else {
            self.priceOneDay.textColor = UIColor.green
        }
        
        if (self.jsonArray[self.getCellClickedPosition()!].variationsPercentage.oneWeek < 0) {
            self.priceOneWeek.textColor = UIColor.red
        } else {
            self.priceOneWeek.textColor = UIColor.green
        }
        self.priceOneDay.text = String(self.jsonArray[self.getCellClickedPosition()!].variationsPercentage.oneDay) + "%"
        self.priceOneWeek.text = String(self.jsonArray[self.getCellClickedPosition()!].variationsPercentage.oneWeek) + "%"
        self.variationLastDay.numberOfLines = 2
        self.variationsLastWeek.numberOfLines = 2

        self.variationLastDay.text = "Variations during last day :"
        self.variationsLastWeek.text = "Variations during last week :"
    }
}
