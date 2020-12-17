//
//  HomeViewPresenter.swift
//  IOSBasic
//
//  Created by Duong Yen-Ly on 17/12/2020.
//

import Foundation
import UIKit


class HomeViewPresenter{
    private  var languages: Languages
    init(languages: Languages) {
        self.languages = languages
        print (languages.Dutch, languages.English, languages.French)
    }
}
