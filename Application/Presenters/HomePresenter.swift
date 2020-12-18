//
//  HomeViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit

class HomePresenter {
    var view: HomeView?
    init(with view: HomeView) {
        self.view = view
    }
    
    func setTitle() {
        self.view?.setTitle()
    }
}

protocol HomeView : AnyObject {
    func setTitle()
}

extension HomeViewController: HomeView {
    func setTitle() {
    }
}
