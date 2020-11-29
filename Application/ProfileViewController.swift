//
//  ProfileViewController.swift
//  IOSBasicProject
//
//  Created by Duong Yen-Ly on 27/11/2020.
//

import Foundation

import UIKit

class ProfileViewController : UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true

        // Do any additional setup after loading the view.
    }

}
