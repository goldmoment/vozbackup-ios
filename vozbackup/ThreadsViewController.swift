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
    @IBOutlet weak var threadsTable: UITableView!
    var data: [AnyObject]! = [] {
        didSet {
            self.threadsTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        threadsTable.delegate = self
        threadsTable.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: ThreadsViewInterface method
    func showThreads(data: [AnyObject]?) {
        self.data = data
//        for object in data! {
//            print(object["title"])
//        }
    }
}

extension ThreadsViewController: UITableViewDelegate {
    
}

extension ThreadsViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("lblCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]["title"] as? String
        return cell
    }
}