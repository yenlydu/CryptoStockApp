//
//  CryptoInformationsController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 01/12/2020.
//

import UIKit
import Charts

class CryptoInformationsViewController: UIViewController, CachingData, ChartViewDelegate {
    @IBOutlet private var lineChart: LineChartView!
    @IBOutlet private weak var bitcoinInformation: UILabel!
    @IBOutlet private weak var aboutLabel: UILabel!
    @IBOutlet private weak var buyButton: UIButton!
    @IBOutlet private weak var sellButton: UIButton!
    @IBOutlet private var priceOneDay: UILabel!
    @IBOutlet private var priceOneWeek: UILabel!
    @IBOutlet private var variationsLastWeek: UILabel!
    @IBOutlet private var variationLastDay: UILabel!
    private lazy var presenter = CyptocurrencyInformationPresenter(with: self)
    var cellClicked: String = ""
    var jsonArray : [Cryptocurrency] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        lineChart.delegate = self
        presenter.setInformations(tempCellClickedName: cellClicked)
        setLineChart()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BuyAmountIdentifier" {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! CalculatorViewController
            vc.cellClicked = cellClicked
        } else if segue.identifier == "SellAmountIdentifier" {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! CalculatorViewController
            vc.cellClicked = cellClicked
        }
    }

    private func setLineChart() {
        var entries = [ChartDataEntry]()
        entries = presenter.getLineChartDatas()
        let set = LineChartDataSet(entries: entries, label: presenter.getLineChartLabel())
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
    }
}

extension CryptoInformationsViewController : CryptocurrencyView {
    func getLineChartDatas() -> [ChartDataEntry] {
        var variations : VariationsLastWeek?
        variations = jsonArray[getCellClickedPosition()!].variationsLastWeek
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
        setBitcoinAbout(cellClickedName: cellClickedName)
        setVariationsLabel()
        setPriceVariations()
        setLabel(cellClickedName: cellClickedName)
    }

    func setBitcoinAbout(cellClickedName: String) {
        let tempAboutCellClicked = "About" + "." + cellClickedName.replacingOccurrences(of: " ", with: "")
        bitcoinInformation.text = tempAboutCellClicked.localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Nil")
        bitcoinInformation.font = bitcoinInformation.font.withSize(20)
        bitcoinInformation.sizeToFit()
        bitcoinInformation.adjustsFontSizeToFitWidth = true
        bitcoinInformation.minimumScaleFactor = 0.5
        bitcoinInformation.numberOfLines = 4
    }

    func setRed(price: UILabel) {
        price.textColor = UIColor.red
    }

    func setGreen(price: UILabel) {
        price.textColor = UIColor.green
    }

    func setPriceVariations() {
        jsonArray[getCellClickedPosition()!].variationsPercentage.oneDay < 0 ? setRed(price: priceOneDay) : setGreen(price: priceOneDay)
        jsonArray[getCellClickedPosition()!].variationsPercentage.oneWeek < 0 ? setRed(price: priceOneWeek) : setGreen(price: priceOneWeek)
        priceOneDay.text = String(jsonArray[getCellClickedPosition()!].variationsPercentage.oneDay) + "%"
        priceOneWeek.text = String(jsonArray[getCellClickedPosition()!].variationsPercentage.oneWeek) + "%"
    }

    func setVariationsLabel() {
        variationLastDay.numberOfLines = 3
        variationsLastWeek.numberOfLines = 3
        variationsLastWeek.lineBreakMode = NSLineBreakMode.byWordWrapping
        variationLastDay.lineBreakMode = NSLineBreakMode.byWordWrapping
        variationsLastWeek.font = variationsLastWeek.font.withSize(16)
        variationLastDay.font = variationLastDay.font.withSize(16)
        variationLastDay.text = "VariationsLastDay".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Variations Last Day")
        variationsLastWeek.text = "VariationsLastWeek".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Variations Last Week")
    }

    func setLabel(cellClickedName: String) {
        aboutLabel.font = UIFont.boldSystemFont(ofSize: 22.0)
        aboutLabel.text = "About".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "About") + " " + cellClickedName
    }
}
