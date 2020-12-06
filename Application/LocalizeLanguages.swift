//
//  LocalizeLanguage.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 03/12/2020.
//

import Foundation


extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: "**\(self)**", comment: "")
    }
}
