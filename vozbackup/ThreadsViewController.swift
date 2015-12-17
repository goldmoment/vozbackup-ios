//
//  ThreadsViewController.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/12/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import UIKit

class ThreadsViewController: UIViewController, ThreadsViewInterface {
    
    var threadsPresenter: ThreadsModuleInterface?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: ThreadsViewInterface method
    func showThreads(data: [AnyObject]?) {
        for object in data! {
            print(object["title"])
        }
    }
}

