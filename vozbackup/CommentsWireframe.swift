//
//  CommentsWireframe.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/21/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

let kCommentsViewControllerIdentifier = "CommentsViewController"

class CommentsWireframe: NSObject {
    var commentsPresenter: CommentsPresenter?
    var commentsViewController: CommentsViewController?
    
    func presentComments(navigationController: UINavigationController?, threadId: String?) {
        let viewController = commentsViewControllerFromStoryboard()
        viewController.commentsPresenter = commentsPresenter
        commentsViewController = viewController
        commentsPresenter?.commentsViewController = viewController
        navigationController?.pushViewController(viewController, animated: true)
        commentsPresenter?.loadComments(threadId!, num: 50)
    }
    
    func commentsViewControllerFromStoryboard() -> CommentsViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(kCommentsViewControllerIdentifier) as! CommentsViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}