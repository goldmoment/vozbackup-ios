//
//  CommentsPresenter.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class CommentsPresenter: NSObject, CommentsInteractorOutput, CommentsModuleInterface {
    var commentsInteractor: CommentsInteractorInput?
    var commentsViewController: CommentsViewInterface?
    var commentsWireframe: CommentsWireframe?
    
    func normalizeThreads(data: [AnyObject]?) -> [AnyObject]? {
        return nil
    }
    
    //MARK: CommentsInteractorOutput
    func loadCommentsComplete(data: [CommentItem]?) {
        commentsViewController?.showComments(data)
    }
    
    //MARK: CommentsModuleInterface
    func loadComments(threadId: String, num: Int) {
        commentsInteractor?.getComments(threadId, num: num)
    }
    func loadCommentsNext(lastItem: CommentItem?, num: Int) {
        commentsInteractor?.getCommentsNext(lastItem, num: num)
    }
}