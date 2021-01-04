//
//  ProfileViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import UIKit

class ProfilePresenter {
    private weak var view: ProfileView?

    init(with view: ProfileView) {
        self.view = view
    }

    func display() {
        view?.setLabelDisplay()
        view?.setBarChartBoughtDatas()
    }
}

protocol ProfileView : class {
    func setLabelDisplay()
    func setBarChartBoughtDatas()
}

