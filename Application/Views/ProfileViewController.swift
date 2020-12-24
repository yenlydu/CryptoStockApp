//
//  ProfileViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation

import UIKit
import Charts

class ProfileViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var text: UITextField!
    @IBOutlet var tableView: UITableView!
    var crypto : [Cryptocurrency] = []
    lazy var presenter = ProfilePresenter(with: self)
    var cryptoClicked:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.setLabelDisplay()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.cryptoClicked = self.crypto[indexPath.row].name
        performSegue(withIdentifier: self.presenter.getWalletIdentifier(), sender: self)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.presenter.getWalletIdentifier() {
            let vc = segue.destination as! WalletViewController
            vc.cryptoClicked = cryptoClicked          
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.crypto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: self.presenter.getCellProfile())
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: self.presenter.getCellProfile())
        }
        cell?.textLabel?.text = self.crypto[indexPath.row].name
        cell?.detailTextLabel?.text = self.crypto[indexPath.row].symbol
        cell?.imageView?.image = UIImage(named: self.crypto[indexPath.row].icon)
        
        return cell!
    }

}
