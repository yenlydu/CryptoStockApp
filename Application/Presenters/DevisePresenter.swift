//
//  DevisePresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 04/01/2021.
//

import Foundation

class DevisePresenter {
    var view : DeviseView?
    
    init(with view: DeviseView) {
        self.view = view
    }

    func setText() {
        view?.setText()
    }
    
    func setDataDevises() {
        view?.setDataDevises()
    }
    
    func doChangeDeviseButtonAction() {
        view?.doChangeDeviseButtonAction()
    }
}

protocol DeviseView {
    func setDataDevises()
    func setText()
    func doChangeDeviseButtonAction()
}
