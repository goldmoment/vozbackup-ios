//
//  ThreadsPresenter.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class ThreadsPresenter: NSObject, ThreadsInteractorOutput, ThreadsModuleInterface {
    var threadsInteractor: ThreadsInteractorInput?
    var threadsViewController: ThreadsViewInterface?
    var threadsWireframe: ThreadsWireframe?
    
    func normalizeThreads(data: [AnyObject]?) -> [AnyObject]? {
        return nil
    }
    
    //MARK: ThreadsInteractorOutput
    func loadThreadsComplete(data: [ThreadItem]?) {
        threadsViewController?.showThreads(data)
    }
    
    //MARK: ThreadsModuleInterface
    func loadThreads(num: Int) {
        threadsInteractor?.getThreads(50)
    }
    func loadThreadsNext(lastItem: ThreadItem?, num: Int) {
        threadsInteractor?.getThreadsNext(lastItem, num: num)
    }
    func loadComments(threadsID: String?) {
        threadsWireframe?.loadComments(threadsID)
    }
}