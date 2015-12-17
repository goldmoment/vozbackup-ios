//
//  ThreadsWireframe.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation
import UIKit

let kThreadsViewControllerIdentifier = "ThreadsViewController"

class ThreadsWireframe: NSObject {
    var threadsPresenter: ThreadsPresenter?
    var rootWireframe : RootWireframe?
    var threadsViewController: ThreadsViewController?
    
    func presentThreadFromWindows(windows: UIWindow) {
        let viewController = threadsViewControllerFromStoryboard()
        viewController.threadsPresenter = threadsPresenter
        threadsViewController = viewController
        threadsPresenter?.threadsViewController = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: windows)
        threadsPresenter?.loadThreads(50)
    }
    
    func threadsViewControllerFromStoryboard() -> ThreadsViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(kThreadsViewControllerIdentifier) as! ThreadsViewController
        return viewController
        
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}