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
    var data: [ThreadItem]! = [] {
        didSet {
            self.threadsTable.reloadData()
            isLoaded = false
        }
    }
    var isLoaded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.layoutIfNeeded()
        
        threadsTable.delegate = self
        threadsTable.dataSource = self
        threadsTable.separatorStyle = UITableViewCellSeparatorStyle.None
        threadsTable.rowHeight = UITableViewAutomaticDimension
        threadsTable.estimatedRowHeight = 100.0
        threadsTable.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: ThreadsViewInterface method
    func showThreads(data: [ThreadItem]?) {
        self.data = self.data + data!
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
        let cell =  tableView.dequeueReusableCellWithIdentifier("threadCell", forIndexPath: indexPath)
        
        let lblTitle = cell.viewWithTag(100) as! UILabel
        let lblReply = cell.viewWithTag(200) as! UILabel
        
        lblTitle.text = data[indexPath.row].title
        lblReply.text = String(data[indexPath.row].replies)
        
        let wrapperView = cell.viewWithTag(50) as UIView!
        let border = CALayer()
        border.frame = CGRectMake(0.0, 0.0, threadsTable.frame.width - 16, 1.0)
        border.backgroundColor = kBarColor.CGColor
        wrapperView.layer.addSublayer(border)
        
        return cell
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == data.count - 1 && isLoaded == false {
            self.threadsPresenter?.loadThreadsNext(data[indexPath.row], num: 50)
            isLoaded = true
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        threadsPresenter?.loadComments(data[indexPath.row].threadId)
    }
}