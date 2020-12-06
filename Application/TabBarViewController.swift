//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class TabBarViewController: UITabBarController {


    @IBOutlet var tabbar: UITabBar!
    var tabBarName : [String] = ["TabBarController.Home", "TabBarController.Prices", "TabBarController.Profile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "welcomeTitle".localized()
        print("welcomeTitle".localized())
        for index  in 0...(tabbar.items!.count - 1) {
            tabbar.items?[index].title = tabBarName[index].localized()
        }
    }


}
