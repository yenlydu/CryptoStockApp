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
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.setTitle("viewDidLoad viewDidLoad viewDidLoad viewDidLoad viewDidLoad  viewDidLoad viewDidLoad", for: UIControl.State.normal)
//        menuSlider.image?.
//        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        menuSlider.image = UIImage(named: "icons8-menu-49")?.withRenderingMode(.alwaysOriginal)
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
//        revealingSplashView.addSubview(imageView)

        // Do any additional setup after loading the view.
    }

}
