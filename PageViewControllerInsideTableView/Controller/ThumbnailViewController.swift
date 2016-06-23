//
//  ThumbnailViewController.swift
//  PageViewControllerInsideTableView
//
//  Created by Akash Malhotra on 6/20/16.
//  Copyright © 2016 Akash Malhotra. All rights reserved.
//

import UIKit

class ThumbnailViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    var image: UIImage?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imgView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setValues(image: UIImage, index: Int) {
        self.image = image
        self.index = index
    }
}
