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
        for i in 0 ..< 6 {
            let pageViewController = CustomPageViewController(images: ["1", "2", "3", "4", "5"])
            pageViewControllers.append(pageViewController)
        }
    }
    
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ThumbnailCell")
        
        //ADD PAGEVIEWCONTROLLER TO PARENT CHILD HIERARCHY
        let pageViewController = pageViewControllers[indexPath.row]
        addChildViewController(pageViewController)
        pageViewController.view.frame = (cell?.contentView.bounds)!
        pageViewController.didMove(toParentViewController: self)
        cell?.contentView.addSubview(pageViewController.view)
       
        
        return cell!
    }

    func tableView(_ tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        
        //REMOVE PAGEVIEWCONTROLLER FROM PARENT CHILD HIERARCHY
        let pageViewController = pageViewControllers[indexPath.row]
        pageViewController.removeFromParentViewController()
        pageViewController.view.removeFromSuperview()
    }
}
