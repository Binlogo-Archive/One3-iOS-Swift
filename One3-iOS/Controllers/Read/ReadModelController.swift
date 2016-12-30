//
//  ReadModelController.swift
//  One3-iOS
//
//  Created by Binboy_王兴彬 on 2016/12/30.
//  Copyright © 2016年 Binboy. All rights reserved.
//

import UIKit

class ReadModelController: NSObject, UIPageViewControllerDataSource {
    
    var pageData: [String] = []
    
    override init() {
        super.init()
        
        let dateFormatter = DateFormatter()
        pageData = dateFormatter.monthSymbols
    }
    
    /// COMMENT: Return the view controller for the given index.
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> ReadViewController? {
        
        if self.pageData.count == 0 || index >= self.pageData.count {
            return nil
        }
        
        let readViewController = storyboard.instantiateViewController(withIdentifier: "ReadViewController") as! ReadViewController
        readViewController.readObject = self.pageData[index]
        
        return readViewController
    }
    
    /// COMMENT: Return the index of the given view controller
    func indexOfViewController(_ viewController: ReadViewController) -> Int {
        return pageData.index(of: viewController.readObject) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! ReadViewController)
        if index == NSNotFound || index == 0 {
            return nil
        }
        
        index -= 1
        
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = self.indexOfViewController(viewController as! ReadViewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.pageData.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }

}
