//
//  HomeViewController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/29.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

class HomeRootViewController: BaseViewController, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController?
    
    lazy var modelController: HomeModelController = HomeModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageViewController()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Setup UI
    
    func setupPageViewController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.delegate = self
        self.pageViewController?.dataSource = self.modelController
        
        let startingViewController: HomeViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers, direction: .forward, animated: false, completion: { _ in })
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        self.pageViewController!.view.frame = self.view.bounds.insetBy(dx: 0.0, dy: 40)
        self.pageViewController!.didMove(toParentViewController: self)
    }

}
