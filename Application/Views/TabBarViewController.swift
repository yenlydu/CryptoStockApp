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
    }

}
