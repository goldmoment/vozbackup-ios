//
//  CommentsViewController.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/25/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController, CommentsViewInterface {
    var commentsPresenter: CommentsModuleInterface?

    @IBOutlet weak var commentsWeb: UIWebView!
    
    var data: [CommentItem]! = [] {
        didSet {
//            self.commentsTable.reloadData()
            self.loadWebView()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWebView() {
        var contentWeb: String = ""
        for item in data {
            var content = item.content
            content = content.stringByReplacingOccurrencesOfString("src=\"/", withString: "src=\"https://vozforums.com/")
            content = content.stringByReplacingOccurrencesOfString("style=\"border:1px inset", withString: "")
            
            contentWeb += content
        }
        contentWeb = "<head><link rel=\"stylesheet\" href=\"myCSS.css\" type=\"text/css\"></head><body>" + contentWeb + "</body>"
        let mainBundleURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
        commentsWeb.loadHTMLString(contentWeb, baseURL: mainBundleURL)
    }
    
    //MARK: ThreadsViewInterface method
    func showComments(data: [CommentItem]?) {
        self.data = self.data + data!
    }
}

//extension CommentsViewController: UITableViewDelegate {
//    
//}
//
//extension CommentsViewController: UITableViewDataSource {
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return data.count
//    }
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell =  tableView.dequeueReusableCellWithIdentifier("cmtCell", forIndexPath: indexPath)
//        
//        let mainBundleURL = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
//        let webView = cell.viewWithTag(100) as! CommentsWebView
//        if (webView.delegate == nil) {
//            webView.delegate = self
//        } else {
//            webView.delegate = nil
//        }
//        webView.index = indexPath.row
//        
//        var content = data[indexPath.row].content
//        content = content.stringByReplacingOccurrencesOfString("src=\"/", withString: "src=\"https://vozforums.com/")
//        content = content.stringByReplacingOccurrencesOfString("style=\"border:1px inset", withString: "")
//        content = "<head><link rel=\"stylesheet\" href=\"myCSS.css\" type=\"text/css\"></head><body>" + content + "</body>"
//        
//        webView.loadHTMLString(content, baseURL: mainBundleURL)
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if let height = self.cmtHeights[indexPath.row] {
//            return height
//        } else {
//            return 44
//        }
//    }
//}
//
//extension CommentsViewController: UIWebViewDelegate {
//    func webViewDidFinishLoad(webView: UIWebView) {
//        webView.frame.size.height = webView.scrollView.contentSize.height
//        webView.scrollView.scrollEnabled = false
//        if let web = webView as? CommentsWebView {
//            self.cmtHeights[web.index] = webView.frame.height
//            self.commentsTable.reloadRowsAtIndexPaths([NSIndexPath(forRow: web.index, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
//        }
//    }
//}
