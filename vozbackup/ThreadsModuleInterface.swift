//
//  ThreadsModuleInterface.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol ThreadsModuleInterface {
    func loadThreads(num: Int)
    func loadThreadsNext(lastThreadsID: Int, num: Int)
    func loadComments(threadsID: Int)
}