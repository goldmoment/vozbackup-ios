//
//  AppDependencies.swift
//  vozbackup
//
//  Created by Vien Van Nguyen on 12/14/15.
//  Copyright © 2015 Vien Van Nguyen. All rights reserved.
//

import Foundation

class AppDependencies {
    var threadsWireframe = ThreadsWireframe()
    
    init() {
        configureDependencies()
    }
    
    func installRootViewControllerIntoWindow(window: UIWindow) {
        threadsWireframe.presentThreadFromWindows(window)
    }
    
    func configureDependencies() {
        let rootWireframe = RootWireframe()
        
        let threadsPresenter = ThreadsPresenter()
        let threadsDataManager = ThreadsDataManager()
        let threadsInteractor = ThreadsInteractor()
        
        threadsWireframe.threadsPresenter = threadsPresenter
        threadsWireframe.rootWireframe = rootWireframe
        
        threadsPresenter.threadsInteractor = threadsInteractor
        threadsPresenter.threadsWireframe = threadsWireframe
        
        threadsDataManager.dataStore = ParseDataStore(tableName: "threads")
        threadsDataManager.threadsInteractor = threadsInteractor
        
        threadsInteractor.dataManager = threadsDataManager
        threadsInteractor.threadsPresenter = threadsPresenter

    }
}