//
//  CommentsInteractor.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class CommentsInteractor: NSObject, CommentsInteractorInput, CommentsDataManagerDelegate {
    var dataManager: CommentsDataManager?
    var commentsPresenter: CommentsInteractorOutput?
    
    // MARK: CommentsInteractorInput
    func getComments(threadId: String, num: Int) {
        dataManager?.loadComments(num, threadId: threadId)
    }
    
    func getCommentsNext(lastItem: CommentItem?, num: Int) {
        dataManager?.loadCommentsNext(lastItem, num: num)
    }
    
    //MARK: CommentsDataManagerDelegate
    func query(didQueryWithResult data: [CommentItem]?, and error: NSError?) {
        if let data = data where error == nil {
            commentsPresenter?.loadCommentsComplete(data)
        }
    }
}