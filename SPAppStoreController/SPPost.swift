//
//  SPPost.swift
//  SPAppStoreController
//
//  Created by Steven Petteruti on 7/8/18.
//  Copyright © 2018 Steven Petteruti. All rights reserved.
//

import UIKit

class SPPost: NSObject {

    
    var name:String
    var title:String
    var thumbnail:String
    var subreddit:String

    init(name:String, subreddit: String, thumbnail: String, title: String) {
        self.name = name
        self.subreddit = subreddit
        self.thumbnail = thumbnail
        self.title = title
    }
    
}
