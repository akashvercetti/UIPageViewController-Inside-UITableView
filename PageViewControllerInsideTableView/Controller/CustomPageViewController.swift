//
//  CustomPageViewController.swift
//  PageViewControllerInsideTableView
//
//  Created by Akash Malhotra on 6/20/16.
//  Copyright © 2016 Akash Malhotra. All rights reserved.
//

import UIKit

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var items : [String]?
    var selectedPageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    init(images: [String]) {
        super.init(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil)
        self.items = images
    }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    //MARK: UI
    func setupUI() {
        self.dataSource = self
        self.delegate = self
    
        setViewControllers([viewControllerAtIndex(0)], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
    }
    
    //MARK: PageViewController Utility
    func viewControllerAtIndex(index: Int) -> ThumbnailViewController {
        let thumbnailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ThumbnailViewController") as! ThumbnailViewController
        thumbnailViewController.setValues(UIImage(named: items![index])!, index: index)
        
        selectedPageIndex = index
        return thumbnailViewController
    }
    
    //MARK: UIPageViewControllerDataSource
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        var index = (viewController as! ThumbnailViewController).index
        if index == 0 {
            return nil
        }
        
        index--
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ThumbnailViewController).index
        
        index++
        if index == 5 {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return selectedPageIndex
    }
}
