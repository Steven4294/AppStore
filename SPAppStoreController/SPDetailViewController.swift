//
//  SPDetailViewController.swift
//  SPAppStoreController
//
//  Created by Steven Petteruti on 7/8/18.
//  Copyright © 2018 Steven Petteruti. All rights reserved.
//

import UIKit

class SPDetailViewController: UIViewController {

    
    @IBOutlet var mainLabel : UILabel!
    var post : SPPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let uw_post = post{
            mainLabel.text = uw_post.title

        }
        mainLabel.numberOfLines = 0
        mainLabel.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
