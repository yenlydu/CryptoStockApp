//
//  CryptoInformationsController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 01/12/2020.
//

import UIKit
import Charts

class CryptoInformationsViewController: UIViewController, CachingData, ChartViewDelegate {

    @IBOutlet var lineChart: LineChartView!
    @IBOutlet weak var bitcoinInformation: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    lazy var presenter = CyptocurrencyInformationPresenter(with: self)
    var cellClicked: String = ""
    var jsonArray : [Cryptocurrency] = []
    var variations : VariationsLastWeek?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setInformations(tempCellClickedName: cellClicked)
        lineChart.delegate = self
        self.getArray()
        var entries = [ChartDataEntry]()
        entries.append(ChartDataEntry(x: 0, y: Double(variations!.monday)))
        entries.append(ChartDataEntry(x: 1, y: Double(variations!.tuesday)))
        entries.append(ChartDataEntry(x: 2, y: Double(variations!.wednesday)))
        entries.append(ChartDataEntry(x: 3, y: Double(variations!.thursday)))
        entries.append(ChartDataEntry(x: 4, y: Double(variations!.friday)))
        entries.append(ChartDataEntry(x: 5, y: Double(variations!.saturday)))
        entries.append(ChartDataEntry(x: 6, y: Double(variations!.sunday)))

        let set = LineChartDataSet(entries: entries, label: "Data")
        set.colors = ChartColorTemplates.material()
        
        let data = LineChartData(dataSet: set)
        self.lineChart.data = data
    }

    func getArray() {
        for i in 0..<jsonArray.count {
            if (cellClicked == jsonArray[i].name) {
                variations = jsonArray[i].variationsLastWeek
                return
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.presenter.getBuyIdentifier() {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! CalculatorViewController
            vc.cryptoName = cellClicked
        } else if segue.identifier == self.presenter.getSellIdentifier() {
            let nav = segue.destination as! UINavigationController
            let vc = nav.topViewController as! CalculatorViewController
            vc.cryptoName = cellClicked
        }
    }
}
