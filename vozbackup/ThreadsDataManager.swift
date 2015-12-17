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
    
    override init() {
        super.init()
    }

    func loadThreads() {
        let conditions = ["skip": 0, "limit": 50, "orderByDescending": "updatedAt"]
        dataStore?.query(conditions)
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