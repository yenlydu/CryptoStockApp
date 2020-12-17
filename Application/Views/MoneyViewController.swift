//
//  MoneyViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation
import UIKit
//import <#module#>
class MoneyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cellClicked : String = "nil"
    var fetchingmore = false
    lazy var presenter = MoneyPresenter(with: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.presenter.tableViewLayout()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        cellClicked = self.presenter.getJsonArrayName(indexRow: indexPath.row)
        performSegue(withIdentifier: self.presenter.getSegueIdentifier(), sender: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.getJsonArray().count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.presenter.getSegueIdentifier() {
            let vc = segue.destination as! CryptoInformations
            vc.cellClicked = cellClicked
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.presenter.getCellIdentifier())
        if cell == nil {

            cell = UITableViewCell(style: .default, reuseIdentifier: self.presenter.getCellIdentifier())
        }
        cell?.imageView?.image = UIImage(named: self.presenter.getJsonArrayIcon(indexRow: indexPath.row))

        cell?.textLabel?.text = self.presenter.getJsonArrayName(indexRow: indexPath.row)
        cell?.detailTextLabel?.text = self.presenter.getJsonArraySymbol(indexRow: indexPath.row)
        cell?.tag = indexPath.row

        return cell!
    }
}

