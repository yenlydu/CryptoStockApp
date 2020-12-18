//
//  ViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import UIKit

class HomeViewController: UIViewController {
//    @IBOutlet private weak var label: UILabel!
//    @IBOutlet private weak var text: UITextField!
//    @IBOutlet private weak var button: UIButton!
    lazy var presenter = HomePresenter(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setTitle()
    }
}
