//
//  CollectionViewController.swift
//  SPAppStoreController
//
//  Created by Steven Petteruti on 7/3/18.
//  Copyright © 2018 Steven Petteruti. All rights reserved.
//

import UIKit
import Cards
import SDWebImage


private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    
    var posts : [SPPost] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SPObjectManager.shared.fetchData { (result) in
            self.posts = result
        
            DispatchQueue.main.async {
                self.collectionView!.reloadData()
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return posts.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SPCollectionViewCell
    

        // Configure the cell
        let post = posts[indexPath.row]
        
        cell.card.backgroundColor = #colorLiteral(red: 0.1764705882, green: 0.5529411765, blue: 0.8392156863, alpha: 1)
        cell.card.title = post.subreddit
        cell.card.itemTitle = post.name
        cell.card.itemSubtitle = ""
        cell.card.textColor = UIColor.white
        
        cell.card.hasParallax = true
        
        
        let manager = SDWebImageManager.shared()
        manager.loadImage(with: URL(string: post.thumbnail), options: SDWebImageOptions(rawValue: 0), progress: nil) { (image, data, err, type, complete, url) in
            if let uw_image = image {
                cell.card.icon = uw_image

            }
            
        }
        
        let cardContentVC = storyboard!.instantiateViewController(withIdentifier: "CardContent") as! SPDetailViewController
        cardContentVC.post = post
        cell.card.shouldPresent(cardContentVC, from: self, fullscreen: false)
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    

}
