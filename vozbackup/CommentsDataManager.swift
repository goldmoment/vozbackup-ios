//
//  CommentsDataManager.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol CommentsDataManagerDelegate {
    func query(didQueryWithResult data: [CommentItem]?, and error: NSError?)
}

class CommentsDataManager: NSObject, BaseDataStoreDelegate {
    var dataStore: BaseDataStore? {
        didSet {
            self.dataStore?.delegate = self
        }
    }
    var commentsInteractor: CommentsDataManagerDelegate?
    var totalComments: Int = 0
    
    override init() {
        super.init()
    }
    
    func loadComments(num: Int, threadId: String) {
        totalComments = 0
        let conditions = ["skip": totalComments, "limit": num, "equalTo": ["threadId": threadId], "orderByAscending": ["index"]]
        dataStore?.query(conditions as! [String : AnyObject])
        totalComments += num
    }
    
    func loadCommentsNext(lastItem: CommentItem?, num: Int) {
        let conditions = ["skip": totalComments, "limit": num, "equalTo": ["threadId": lastItem!.threadId], "greaterThan": ["index": lastItem!.index]]
        dataStore?.query(conditions as! [String : AnyObject])
        totalComments += num
    }
    
    func query(commentID: Int, num: Int) {
        
    }
    
    //MARK: BaseDataManagerDelegate
    func query(didQueryWithResult data: [AnyObject]?, error: NSError?) {
        if let data = data where error == nil {
            var result: [CommentItem] = []
            for item in data {
                result.append(CommentItem(cmtId: item["cmtId"] as! String,
                                        threadId: item["threadId"] as! String,
                                        avater: item["avater"] as! String,
                                        content: item["content"] as! String,
                                        index: item["index"] as! Int,
                                        time: item["time"] as! Int,
                                        createdAt: item.createdAt!!,
                                        updatedAt: item.updatedAt!!))
            }
            commentsInteractor?.query(didQueryWithResult: result, and: error)
        }
    }
}