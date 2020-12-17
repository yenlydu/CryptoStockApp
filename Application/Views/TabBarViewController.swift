//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class TabBarViewController: UITabBarController {


    @IBOutlet private weak var tabbar: UITabBar!
    var tabBarName : [String] = ["TabBarController.Home", "TabBarController.Prices", "TabBarController.Profile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "welcomeTitle".localized()
        print("welcomeTitle".localized())
        tabbar.items?.enumerated().forEach {
            index, item in
            item.title = tabBarName[index].localized()
            print(item.title!)
        }
    }

}
