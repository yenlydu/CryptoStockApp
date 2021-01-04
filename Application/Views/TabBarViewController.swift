//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class TabBarViewController: UITabBarController {
    @IBOutlet weak var tabbar: UITabBar!
    private lazy var presenter = TabBarPresenter(with: self)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter.setTitle()
        let navController = viewControllers![1] as! UINavigationController
        let vc = navController.topViewController as! ProfileViewController
        vc.jsonArray = presenter.getJsonArray()

    }
}
