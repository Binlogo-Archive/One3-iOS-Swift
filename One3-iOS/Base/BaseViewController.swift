//
//  BaseViewController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/29.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBarLeftItemSearch()
        setupNavigationBarRightItemMe()
    }
    
    func setupNavigationBarLeftItemSearch() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_search"), style: .plain, target: self, action: #selector(BaseViewController.showSearchViewController))
    }

    func setupNavigationBarRightItemMe() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "nav_me_normal"), style: .plain, target: self, action: #selector(BaseViewController.pushMeViewController))
    }
    
    func showSearchViewController() {
        let searchViewController = SearchViewController()
        let navigationController = UINavigationController(rootViewController: searchViewController)
        self.present(navigationController, animated: true) {
            
        }
    }
    
    func pushMeViewController() {
        
    }

}
