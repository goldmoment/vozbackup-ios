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
            var info = "<div class='cmt-author'><div class ='cmt-image'>" +
            item.avater + "</div><div class ='cmt-info'><p>" +
            item.author + "</p><i>" +
            "Today" + "</i></div><div class ='cmt-index'><span>#" + String(item.index) + "</span></div></div>"
            info = info.replace("src=\"cu", by: "src=\"https://vozforums.com/cu");
            
            var content = item.content
            content = content.replace("src=\"/", by: "src=\"https://vozforums.com/")
            content = content.replace("style=\"border:1px inset", by: "")
            content = content.replace("src=\"im", by: "src=\"https://vozforums.com/im");
            
            contentWeb += "<div class='cmt-content shadow'>"+info+content+"</div>"
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