//
//  SPObjectManager.swift
//  SPAppStoreController
//
//  Created by Steven Petteruti on 7/8/18.
//  Copyright © 2018 Steven Petteruti. All rights reserved.
//

import UIKit
import SwiftyJSON

class SPObjectManager: NSObject {

    // Can't init is singleton
    private override init() { }
    
    // MARK: Shared Instance
    
    static let shared = SPObjectManager()
    
    func fetchData(completion: @escaping (_: [SPPost]) -> Void) {
        
        let endpoint: String = "https://www.reddit.com/top/.json?limit=25"
        guard let url = URL(string: endpoint) else {
            print("Error: cannot create URL")
            return
        }
        let urlRequest = URLRequest(url: url)
        
        // set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error getting reddit posts")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                
                let json = try JSON(data: responseData)
                
                let children = json["data"]["children"]
                var posts : [SPPost] = []
                for (_, post) in children {
                    let name = post["data"]["author"].string!
                    let title = post["data"]["title"].string!
                    let subreddit = post["data"]["subreddit"].string!
                    let thumbnail = post["data"]["thumbnail"].string!

                    posts.append(SPPost.init(name:name, subreddit: subreddit, thumbnail: thumbnail, title: title))
                    
                }
                completion(posts)

            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        
        
        
    }
    
}
