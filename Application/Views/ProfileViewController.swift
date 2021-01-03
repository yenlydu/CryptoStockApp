//
//  ProfileViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation

import UIKit
import Charts

class ProfileViewController : UIViewController, CachingData, ChartViewDelegate {
    @IBOutlet var text: UITextField!
    var crypto : [Cryptocurrency] = []
    lazy var presenter = ProfilePresenter(with: self)
    @IBOutlet var barChartSold: BarChartView!
    @IBOutlet var barChartBought: BarChartView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        title = "TabBarController.Profile".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
        var wallet = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>
        self.presenter.setLabelDisplay()

        var entriesBought = [BarChartDataEntry]()
        var labelsBought : [String] = []
        for i in 0..<wallet!.count {
            labelsBought.append(crypto[i].symbol)
            entriesBought.append(BarChartDataEntry(x: Double(i), y: Double(wallet![crypto[i].name]!)))
        }
        barChartBought.xAxis.labelPosition = XAxis.LabelPosition.bottom
        barChartBought.animate(yAxisDuration: 2.0)
        barChartBought.pinchZoomEnabled = false
        barChartBought.drawBarShadowEnabled = false
        barChartBought.drawBordersEnabled = false
        barChartBought.doubleTapToZoomEnabled = false
        barChartBought.drawGridBackgroundEnabled = true
        barChartBought.xAxis.valueFormatter = IndexAxisValueFormatter(values: labelsBought)
        let setBought = BarChartDataSet(entries: entriesBought, label: "test")
        let dataBought = BarChartData(dataSet: setBought)
        setBought.colors = ChartColorTemplates.joyful()
        barChartBought.center = view.center
        barChartBought.data = dataBought
        barChartBought.delegate = self
    }
    
    func getClickedInformations(clickedCellSymbol: String) -> String? {
        for i in 0..<crypto.count {
            if (clickedCellSymbol == crypto[i].symbol) {
                return crypto[i].name
            }
        }
        return nil
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "walletIdentifier") as? WalletBoughtViewController

        vc?.cryptoClickedInformations = [crypto[Int(entry.x)].name,  String(entry.y)]
        navigationController?.pushViewController(vc!, animated: true)
    }
}
