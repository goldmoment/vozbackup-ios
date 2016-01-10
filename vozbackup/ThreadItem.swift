//
//  ThreadItem.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/20/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

struct ThreadItem {
    let threadId: String
    let title: String
    let views: Int
    let replies: Int
    let createdAt: NSDate
    let updatedAt: NSDate
    init(threadId: String, title: String, views: Int, replies: Int, createdAt: NSDate, updatedAt: NSDate) {
        self.threadId = threadId
        self.title = title
        self.views = views
        self.replies = replies
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }
}