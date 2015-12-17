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
    func getThreadsNext(lastThreadsID: Int, num: Int)
}

protocol ThreadsInteractorOutput {
    func loadThreadsComplete(data: [AnyObject]?)
}