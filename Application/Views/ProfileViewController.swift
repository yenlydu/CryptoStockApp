//
//  ProfileViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation

import UIKit

class ProfileViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet var text: UITextField!
    @IBOutlet var tableView: UITableView!
    var crypto: [Cryptocurrency] = []
    lazy var presenter = ProfilePresenter(with: self)
    var str:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("profil", crypto[0].name)
        
        self.presenter.setLabelDisplay()
        tableView.delegate = self
        tableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crypto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellProfile")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cellProfile")
        }
        cell?.textLabel?.text = crypto[indexPath.row].name
        cell?.detailTextLabel?.text = crypto[indexPath.row].symbol
        cell?.imageView?.image = UIImage(named: crypto[indexPath.row].icon)

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
