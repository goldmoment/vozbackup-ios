//
//  BaseDataManager.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/14/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation
@objc protocol BaseDataStoreDelegate {
    optional func insert(object: AnyObject!, didInsertWithResult result: Bool, error: NSError?)
    optional func update(object: AnyObject!, didUpdatetWithResult result: Bool, error: NSError?)
    optional func remove(object: AnyObject!, didRemoveWithResult result: Bool, error: NSError?)
    optional func query(didQueryWithResult data: [AnyObject]?, error: NSError?)
}

protocol BaseDataStore {
    var tableName: String? {get set}
    var dbConnection: AnyObject? {get set}
    var delegate: BaseDataStoreDelegate? {get set}
    
    func insert(data: [String: AnyObject]!)
    func update(id: String!, data: [String: AnyObject]!)
    func remove(id: String!)
    func query(conditions: [String: AnyObject]!)
}