//
//  ReadRootViewController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/30.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

class ReadRootViewController: BaseViewController, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController?
    
    lazy var modelController: ReadModelController = ReadModelController()
    
    @IBOutlet weak var cycleScrollView: CycleScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPageViewController()
    }

    // MARK: Setup UI
    
    func setupPageViewController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController?.delegate = self
        self.pageViewController?.dataSource = self.modelController
        
        let startingViewController: ReadViewController = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController?.setViewControllers(viewControllers, direction: .forward, animated: false, completion: { _ in })
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        let pageViewRect = CGRect(x: 0, y: 144 + 64, width: view.bounds.width, height: view.bounds.height - 144 - 64)
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMove(toParentViewController: self)
    }

}
