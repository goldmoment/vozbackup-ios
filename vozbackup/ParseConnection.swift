//
//  ParseConnection.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/14/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class ParseConnection: NSObject {
    static let defaultParse = ParseConnection()
    override init() {
        super.init()
        Parse.enableLocalDatastore()
        Parse.setApplicationId("jQqq8FB0WmBi258N857Elg7zyBQPibkNlmbDNBj6", clientKey: "roM0mNgeaNHDCZiXs2RHoTO08CGIPkwprLGAn7Dw")
    }
}