//
//  ParametersViewController.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 15/12/2020.
//

import UIKit

class ParametersViewController : UITableViewController {

    @IBOutlet var labelCountry: UILabel!
    @IBOutlet var labelCurrency: UILabel!
    
//    @IBOutlet var parametersTableView: UITableViewCell!
    @IBOutlet var parametersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelCountry.text = "Country".localized()
        self.labelCurrency.text = "ChangeCurrency".localized()
     }
    
    

//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = parametersTableView.dequeueReusableCell(withIdentifier: "cellParameters")
//        cell?.textLabel?.text = "Test"
//        return cell!
//    }
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        parametersTableView.deselectRow(at: indexPath, animated: true)
//    }
}
