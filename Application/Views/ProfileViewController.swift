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
    @IBOutlet private var barChartBought: BarChartView!
    private lazy var presenter = ProfilePresenter(with: self)
    var jsonArray : [Cryptocurrency] = []

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        title = "TabBarController.Profile".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Profile")
        presenter.display()
    }

    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "walletIdentifier") as? WalletBoughtViewController

        vc?.cryptoClickedInformations = [jsonArray[Int(entry.x)].name,  String(entry.y)]
        navigationController?.pushViewController(vc!, animated: true)
    }
}

extension ProfileViewController : ProfileView {
    func setLabelDisplay() {
        text.text = "Wallet".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Wallet")
        text.textAlignment = .center
        text.borderStyle = .none
        text.layer.cornerRadius = 14
        text.backgroundColor = UIColor.lightGray
        text.layer.borderWidth = 0.25
        text.layer.borderColor = UIColor.white.cgColor
        text.layer.shadowOpacity = 1
        text.layer.shadowRadius = 3.0
        text.layer.shadowOffset = CGSize.zero
        text.layer.shadowColor = UIColor.gray.cgColor
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: text.frame.height))
        text.leftViewMode = UITextField.ViewMode.always
        text.isUserInteractionEnabled = false
    }

    func setBarChartBoughtDatas() {
        var entriesBought = [BarChartDataEntry]()
        var labelsBought : [String] = []
        let wallet = getObject(fileName: "myWallet") as? Dictionary<String, Double>

        for i in 0..<wallet!.count {
            labelsBought.append(jsonArray[i].symbol)
            entriesBought.append(BarChartDataEntry(x: Double(i), y: Double(wallet![jsonArray[i].name]!)))
        }
        barChartBought.xAxis.labelPosition = XAxis.LabelPosition.bottom
        barChartBought.animate(yAxisDuration: 2.0)
        barChartBought.pinchZoomEnabled = false
        barChartBought.drawBarShadowEnabled = false
        barChartBought.drawBordersEnabled = false
        barChartBought.doubleTapToZoomEnabled = false
        barChartBought.drawGridBackgroundEnabled = true
        barChartBought.center = view.center
        barChartBought.delegate = self
        barChartBought.xAxis.valueFormatter = IndexAxisValueFormatter(values: labelsBought)
        let setBought = BarChartDataSet(entries: entriesBought, label: "WalletContent".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!))
        let dataBought = BarChartData(dataSet: setBought)
        setBought.colors = ChartColorTemplates.joyful()
        barChartBought.data = dataBought
    }
}
