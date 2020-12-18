//
//  ProfileViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation

import UIKit

class ProfileViewController : UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!

    @IBOutlet var menuSlider: UIBarButtonItem!
    lazy var presenter = ProfilePresenter(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.imageLayout()
    }

}
