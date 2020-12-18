//
//  TabBarPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 18/12/2020.
//

import UIKit

class TabBarPresenter {
    var view : TabBarView?
    init(with view: TabBarView) {
        self.view = view
    }
    
    func setTitle() {
        view?.setTitle()
    }
}

protocol TabBarView {
    func setTitle()
}
extension TabBarViewController : TabBarView {
    func setTitle() {
        let tabBarName : [String] = ["TabBarController.Home", "TabBarController.Prices", "TabBarController.Profile"]
        self.tabbar.items?.enumerated().forEach {
            index, item in
            item.title = tabBarName[index].localized()
        }
    }
}
