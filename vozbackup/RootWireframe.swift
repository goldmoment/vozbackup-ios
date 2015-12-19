//
//  RootWireframe.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/16/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class RootWireframe: NSObject {
    func showRootViewController(viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.navigationBar.barTintColor = kBarColor
        return navigationController
    }
}