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
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let transactionSoldDate = self.getObject(fileName: "transactionSoldDate") as? Dictionary<String, Str>
//        let transactionBoughtDate = self.getObject(fileName: "transactionBoughtDate") as? Dictionary<String, Double>

        
        
        self.presenter.setLabelDisplay()
        
    }
    
    override func viewDidLayoutSubviews() {
        var wallet = self.getObject(fileName: "myWallet") as? Dictionary<String, Double>

        super.viewDidLayoutSubviews()
//        var dataEntries: [ChartDataEntry] = []
//        for i in 0..<wallet!.count {
//            print ("tr" , wallet![crypto[i].name] , " ", crypto[i].name)
//            if (wallet![crypto[i].name]! <= 0) {
//                let dataEntry = PieChartDataEntry(value: Double(0)
//                                        , label: crypto[i].symbol, data: crypto[i].name as AnyObject)
//                dataEntries.append(dataEntry)
//            } else {
//                let dataEntry = PieChartDataEntry(value: Double(wallet![crypto[i].name]!)
//                                        , label: crypto[i].symbol, data: crypto[i].name as AnyObject)
//                dataEntries.append(dataEntry)
//
//            }
//        }
////        print
//        // 2. Set ChartDataSet
//        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: nil)
//        pieChartDataSet.colors = ChartColorTemplates.material()
//        // 3. Set ChartData
//        let pieChartData = PieChartData(dataSet: pieChartDataSet)
//        let format = NumberFormatter()
//        format.numberStyle = .none
//        let formatter = DefaultValueFormatter(formatter: format)
//        pieChartData.setValueFormatter(formatter)
//        // 4. Assign it to the chart’s data
//        pieChart.data = pieChartData
//        pieChartData.notifyDataChanged(); // let the data know a dataSet changed
//        pieChart.notifyDataSetChanged(); // let the chart know it's data changed

        
        
        
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
//        barChartBought.fitScreen()

        print(entriesBought)

        let setBought = BarChartDataSet(entries: entriesBought, label: "test")
        let dataBought = BarChartData(dataSet: setBought)
        setBought.colors = ChartColorTemplates.joyful()
        barChartBought.data = dataBought
        barChartBought.center = view.center
        barChartBought.delegate = self

        
        
        
        
//        
//        var entriesSold = [BarChartDataEntry]()
//        var labelsSold : [String] = []
//        for i in 0..<wallet!.count {
//            labelsSold.append(crypto[i].symbol)
//            entriesSold.append(BarChartDataEntry(x: Double(i), y: Double(wallet![crypto[i].name]!)))
//        }
//        
//        barChartSold.xAxis.labelPosition = XAxis.LabelPosition.bottom
//        barChartSold.animate(yAxisDuration: 2.0)
//        barChartSold.pinchZoomEnabled = false
//        barChartSold.drawBarShadowEnabled = false
//        barChartSold.drawBordersEnabled = false
//        barChartSold.doubleTapToZoomEnabled = false
//        barChartSold.drawGridBackgroundEnabled = true
//
//        barChartSold.xAxis.valueFormatter = IndexAxisValueFormatter(values: labelsSold)
////        barChartBought.fitScreen()
//
//        print(entriesSold)
//
//        let setSold = BarChartDataSet(entries: entriesSold, label: "test")
//        let dataSold = BarChartData(dataSet: setSold)
//        setSold.colors = ChartColorTemplates.joyful()
//        barChartSold.data = dataBought
//        barChartSold.center = view.center
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
        print (entry)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "walletIdentifier") as? WalletBoughtViewController

        vc?.cryptoClickedInformations = [crypto[Int(entry.x)].name,  String(entry.y)]

        self.navigationController!.pushViewController(vc!, animated: true)
        
    }
}
