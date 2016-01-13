//
//  Extensions.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 1/12/16.
//  Copyright © 2016 Vien Van Nguyen. All rights reserved.
//

import Foundation

extension String {
    func replace(str1: String, by str2: String) -> String {
        return self.stringByReplacingOccurrencesOfString(str1, withString: str2)
    }
}