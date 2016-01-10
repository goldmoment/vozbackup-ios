//
//  ThreadsInteractor.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class ThreadsInteractor: NSObject, ThreadsInteractorInput, ThreadsDataManagerDelegate {
    var dataManager: ThreadsDataManager?
    var threadsPresenter: ThreadsInteractorOutput?
    
    // MARK: ThreadsInteractorInput
    func getThreads(num: Int) {
        dataManager?.loadThreads(50)
    }
    
    func getThreadsNext(lastItem: ThreadItem?, num: Int) {
        dataManager?.loadThreadsNext(lastItem, num: num)
    }
    
    //MARK: ThreadsDataManagerDelegate
    func query(didQueryWithResult data: [ThreadItem]?, and error: NSError?) {
        if let data = data where error == nil {
            threadsPresenter?.loadThreadsComplete(data)
        }
    }
}