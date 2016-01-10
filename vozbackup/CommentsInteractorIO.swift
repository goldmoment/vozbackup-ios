//
//  CommentsInteractorIO.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol CommentsInteractorInput {
    func getComments(threadId: String, num: Int)
    func getCommentsNext(lastItem: CommentItem?, num: Int)
}

protocol CommentsInteractorOutput {
    func loadCommentsComplete(data: [CommentItem]?)
}