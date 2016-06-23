//
//  MainViewController.swift
//  PageViewControllerInsideTableView
//
//  Created by Akash Malhotra on 6/20/16.
//  Copyright © 2016 Akash Malhotra. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var imageTableView: UITableView!
    var pageViewControllers = [CustomPageViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UI
    func setupUI() {
        //CELL HEIGHT = 45% OF THE SCREEN
        imageTableView.rowHeight = 0.45 * view.frame.size.height
        
        //PRESERVING PAGEVIEWCONTROLLERS IN AN ARRAY TO PRESERVE THE PAGE CHANGE IN EACH PAGEVIEWCONTROLLER
        for var i = 0; i < 6; i++ {
            let pageViewController = CustomPageViewController(images: ["1", "2", "3", "4", "5"])
            pageViewControllers.append(pageViewController)
        }
    }
    
    
    //MARK: UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ThumbnailCell")
        
        
        let pageViewController = pageViewControllers[indexPath.row]
        addChildViewController(pageViewController)
        pageViewController.view.frame = (cell?.contentView.bounds)!
        pageViewController.didMoveToParentViewController(self)
        cell?.contentView.addSubview(pageViewController.view)
       
        
        return cell!
    }

}
