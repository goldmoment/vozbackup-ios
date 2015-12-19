//
//  ThreadsDataManager.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol ThreadsDataManagerDelegate {
    func query(didQueryWithResult data: [AnyObject]?, and error: NSError?)
}

class ThreadsDataManager: NSObject, BaseDataStoreDelegate {
    var dataStore: BaseDataStore? {
        didSet {
            self.dataStore?.delegate = self
        }
    }
    var threadsInteractor: ThreadsDataManagerDelegate?
    var totalThreads: Int = 0
    
    override init() {
        super.init()
    }

    func loadThreads() {
        let conditions = ["skip": totalThreads, "limit": 50, "orderByDescending": "updatedAt"]
        dataStore?.query(conditions as! [String : AnyObject])
        totalThreads += 50
    }
    
    func loadThreadsNext(lastThreadId: String?, num: Int) {
        let conditions = ["skip": totalThreads, "limit": num, "orderByDescending": "updatedAt", "lessThan": ["updatedAt": lastThreadId!]]
        dataStore?.query(conditions as! [String : AnyObject])
        totalThreads += num
    }
    
    func query(threadsID: Int, num: Int) {
        
    }
    
    //MARK: BaseDataManagerDelegate
    func query(didQueryWithResult data: [AnyObject]?, error: NSError?) {
        if error == nil {
            threadsInteractor?.query(didQueryWithResult: data, and: error)
        }
    }

}