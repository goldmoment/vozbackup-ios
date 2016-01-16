//
//  ThreadsDataManager.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol ThreadsDataManagerDelegate {
    func query(didQueryWithResult data: [ThreadItem]?, and error: NSError?)
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

    func loadThreads(num: Int) {
        totalThreads = 0
        let conditions = ["skip": totalThreads, "limit": num, "orderByDescending": ["createdAt"]]
        dataStore?.query(conditions as! [String : AnyObject])
        totalThreads += num
    }
    
    func loadThreadsNext(lastItem: ThreadItem?, num: Int) {
        let conditions = ["limit": num, "orderByDescending": ["createdAt"], "lessThan": ["createdAt": lastItem!.createdAt]]
        dataStore?.query(conditions as! [String : AnyObject])
        totalThreads += num
    }
    
    func query(threadsID: Int, num: Int) {
        
    }
    
    //MARK: BaseDataManagerDelegate
    func query(didQueryWithResult data: [AnyObject]?, error: NSError?) {
        if let data = data where error == nil {
            var result: [ThreadItem] = []
            for item in data {
                result.append(ThreadItem(threadId: item["threadId"] as! String,
                    title: item["title"] as! String,
                    views: item["views"] as! Int,
                    replies: item["replies"] as! Int,
                    createdAt: item.createdAt!!,
                    updatedAt: item.updatedAt!!))
            }
            threadsInteractor?.query(didQueryWithResult: result, and: error)
        }
    }

}