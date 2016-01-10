//
//  CommentsModuleInterface.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol CommentsModuleInterface {
    func loadComments(threadId: String, num: Int)
    func loadCommentsNext(lastItem: CommentItem?, num: Int)
}