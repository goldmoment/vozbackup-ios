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
        dataManager?.loadThreads()
    }
    
    func getThreadsNext(lastThreadsID: String?, num: Int) {
        dataManager?.loadThreads()
    }
    
    //MARK: ThreadsDataManagerDelegate
    func query(didQueryWithResult data: [AnyObject]?, and error: NSError?) {
        if error == nil {
            threadsPresenter?.loadThreadsComplete(data)
        }
    }
}