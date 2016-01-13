//
//  CommentItem.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

struct CommentItem {
    let cmtId: String
    let threadId: String
    let author: String
    let avater: String
    let content: String
    let index: Int
    let time: Int
    let createdAt: NSDate
    let updatedAt: NSDate
    init(cmtId: String, threadId: String, author: String, avater: String, content: String, index: Int, time: Int, createdAt: NSDate, updatedAt: NSDate) {
        self.cmtId = cmtId
        self.threadId = threadId
        self.author = author
        self.avater = avater
        self.content = content
        self.index = index
        self.time = time
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}