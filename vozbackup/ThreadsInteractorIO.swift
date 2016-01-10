//
//  ThreadsInteractorIO.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

protocol ThreadsInteractorInput {
    func getThreads(num: Int)
    func getThreadsNext(lastItem: ThreadItem?, num: Int)
}

protocol ThreadsInteractorOutput {
    func loadThreadsComplete(data: [ThreadItem]?)
}