//
//  MoneyViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation
import UIKit

class MoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet private weak var tableView: UITableView!
    private var cellClicked : String = ""
    private lazy var presenter = MoneyPresenter(with: self)

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.delegate = self
        tableView.dataSource = self
        presenter.tableViewLayout()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        cellClicked = presenter.getJsonArrayName(indexRow: indexPath.row)
        performSegue(withIdentifier: "displayCryptoInfo", sender: self)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getJsonArray().count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "displayCryptoInfo" {
            let vc = segue.destination as! CryptoInformationsViewController
            vc.cellClicked = cellClicked
            vc.jsonArray = presenter.getJsonArray()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.imageView?.image = UIImage(named: presenter.getJsonArrayIcon(indexRow: indexPath.row))
        cell?.textLabel?.text = presenter.getJsonArrayName(indexRow: indexPath.row)
        cell?.detailTextLabel?.text = presenter.getJsonArraySymbol(indexRow: indexPath.row)
        cell?.tag = indexPath.row
        return cell!
    }
}

extension MoneyViewController : MoneyView {
    func setTitle() {
        title = "TabBarController.Prices".localizableString(str: UserDefaults.standard.string(forKey: "Languages") ?? "Prices")
    }

    func tableViewLayout() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160
    }
}
