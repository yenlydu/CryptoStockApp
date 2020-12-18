//
//  ProfileViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import UIKit

class ProfilePresenter {
    var view: ProfileView?
    
    init(with view: ProfileView) {
        self.view = view
    }
    
    func imageLayout() {
        self.view?.imageLayout()
    }
}

protocol ProfileView : AnyObject {
    func imageLayout()
}

extension ProfileViewController : ProfileView {
    func imageLayout() {
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
}
