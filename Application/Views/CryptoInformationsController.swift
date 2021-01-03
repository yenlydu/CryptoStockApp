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
    @IBOutlet var priceOneDay: UILabel!
    @IBOutlet var priceOneWeek: UILabel!
    @IBOutlet var variationsLastWeek: UILabel!
    @IBOutlet var variationLastDay: UILabel!
    var cellClicked: String = ""
    var jsonArray : [Cryptocurrency] = []
    var variations : VariationsLastWeek?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setInformations(tempCellClickedName: cellClicked)
        lineChart.delegate = self
        setLineChart()
    }

    func setLineChart() {
        var entries = [ChartDataEntry]()
        entries = self.presenter.getLineChartDatas()

        let set = LineChartDataSet(entries: entries, label: self.presenter.getLineChartLabel())
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        self.lineChart.data = data
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
