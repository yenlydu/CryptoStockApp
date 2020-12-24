//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class TabBarViewController: UITabBarController {
    @IBOutlet  weak var tabbar: UITabBar!
    lazy var presenter = TabBarPresenter(with: self)

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.presenter.setTitle()
        let navController = self.viewControllers![2] as! UINavigationController
        let vc = navController.topViewController as! ProfileViewController
        vc.crypto = self.presenter.getJsonArray()
        
    }
}
