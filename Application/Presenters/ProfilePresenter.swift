//
//  ProfileViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import UIKit

class ProfilePresenter {
    var view: ProfileView?
    var walletIdentifier: String = "walletIdentifier"
    var cellProfile: String = "cellProfile"
    var cryptoClicked: String = ""

    init(with view: ProfileView) {
        self.view = view
    }
    
    func getCellProfile() -> String {
        return self.cellProfile
    }

    func getWalletIdentifier() -> String {
        return self.walletIdentifier
    }
    
    func setLabelDisplay() {
        self.view?.setLabelDisplay()
    }
}

protocol ProfileView : AnyObject {
    func setLabelDisplay()
}

extension ProfileViewController : ProfileView {
    func setLabelDisplay() {
        self.text.text = "Wallet".localizableString(str: UserDefaults.standard.string(forKey: "Languages")!)
        self.text.textAlignment = .center
        self.text.borderStyle = .none
        self.text.layer.cornerRadius = 14
        self.text.backgroundColor = UIColor.lightGray
        self.text.layer.borderWidth = 0.25
        self.text.layer.borderColor = UIColor.white.cgColor
        self.text.layer.shadowOpacity = 1
        self.text.layer.shadowRadius = 3.0
        self.text.layer.shadowOffset = CGSize.zero
        self.text.layer.shadowColor = UIColor.gray.cgColor
        self.text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: text.frame.height))
        self.text.leftViewMode = UITextField.ViewMode.always
        self.text.isUserInteractionEnabled = false
    }
}
