//
//  LocalizeLanguage.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 03/12/2020.
//

import Foundation


extension String {
//<
    func localizableString(str: String) -> String {
        guard let path = Bundle.main.path(forResource: str, ofType: "lproj"), let bundle = Bundle(path: path) else {
            fatalError("File not found")
       }
       return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
