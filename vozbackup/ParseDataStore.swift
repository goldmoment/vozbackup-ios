//
//  ParseDataManager.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/14/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class ParseDataStore: NSObject, BaseDataStore {
    
    //MARK: BaseDataManager property
    var tableName: String? {
        didSet {
            self.parseQuery = PFQuery(className: tableName!)
            self.parseObject = PFObject(className: tableName!)
        }
    }
    var dbConnection: AnyObject? = ParseConnection.defaultParse
    var delegate: BaseDataStoreDelegate?
    
    //MARK: Private property
    var parseQuery: PFQuery?
    var parseObject: PFObject?
    
    init(tableName: String) {
        super.init()
        self.tableName = tableName
        self.parseQuery = PFQuery(className: tableName)
        self.parseObject = PFObject(className: tableName)
    }
    
    //MARK: BaseDataManager method
    func insert(data: [String: AnyObject]!) {
        for key in data.keys {
            parseObject?[key] = data[key]
        }
        parseObject?.saveInBackgroundWithBlock {
            (result: Bool, error: NSError?) -> Void in
            // The object has been saved.
            self.delegate?.insert?(parseQuery, didInsertWithResult: result, error: error)
            
        }
    }
    func update(id: String!, data: [String: AnyObject]!) {
        parseQuery?.getObjectInBackgroundWithId(id) {
            (object: PFObject?, error: NSError?) -> Void in
            if error != nil {
                self.delegate?.update?(object, didUpdatetWithResult: false, error: error)
            } else if let object = object {
                for key in data.keys {
                    object[key] = data[key]
                }
                object.saveInBackground()
                object.saveInBackgroundWithBlock({ (result: Bool, error: NSError?) -> Void in
                    self.delegate?.update?(object, didUpdatetWithResult: result, error: error)
                })
            }
        }
    }
    func remove(id: String!) {
        parseQuery?.getObjectInBackgroundWithId(id) {
            (object: PFObject?, error: NSError?) -> Void in
            if error != nil {
                print(error)
            } else if let object = object {
                object.deleteInBackgroundWithBlock({ (result: Bool, error: NSError?) -> Void in
                    self.delegate?.remove?(object, didRemoveWithResult: result, error: error)
                })
            }
        }
    }
    func query(conditions: [String: AnyObject]!) {
        self.parseQuery?.cancel()
        self.parseQuery = PFQuery(className: tableName!)
        
        for key in conditions.keys {
            switch key {
            case "limit":
                if let num = conditions[key] as? Int {
                    parseQuery?.limit =  num
                }
                break
            case "skip":
                if let num = conditions[key] as? Int {
                    parseQuery?.skip =  num
                }
                break
            case "orderByDescending":
                if let str = conditions[key] as? [String] {
                    for item in str {
                        parseQuery?.orderByDescending(item)
                    }
                }
                break
            case "orderByAscending":
                if let str = conditions[key] as? [String] {
                    for item in str {
                        parseQuery?.orderByAscending(item)
                    }
                }
                break
            default:
                if let subConditions = conditions[key] as? [String: AnyObject] {
                    for subKey in subConditions.keys {
                        switch key {
                        case "equalTo":
                            parseQuery?.whereKey(subKey, equalTo: subConditions[subKey]!)
                            break
                        case "greaterThan":
                            parseQuery?.whereKey(subKey, greaterThan: subConditions[subKey]!)
                            break
                        case "greaterThanOrEqualTo":
                            parseQuery?.whereKey(subKey, greaterThanOrEqualTo: subConditions[subKey]!)
                            break
                        case "lessThan":
                            parseQuery?.whereKey(subKey, lessThan: subConditions[subKey]!)
                            break
                        case "lessThanOrEqualTo":
                            parseQuery?.whereKey(subKey, lessThanOrEqualTo: subConditions[subKey]!)
                            break
                        case "notEqualTo":
                            parseQuery?.whereKey(subKey, notEqualTo: subConditions[subKey]!)
                            break
                        default:
                            break
                        }
                    }
                }
                break
            }
        }
        
        parseQuery?.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            // Do something with the found objects
            self.delegate?.query?(didQueryWithResult: objects, error: error)
        }
    }
}