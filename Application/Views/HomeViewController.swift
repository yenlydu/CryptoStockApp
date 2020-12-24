//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class HomeViewController: UIViewController {
    lazy var presenter = HomePresenter(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setTitle()
    }
}
