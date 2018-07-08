//
//  SPCollectionViewCell.swift
//  SPAppStoreController
//
//  Created by Steven Petteruti on 7/8/18.
//  Copyright © 2018 Steven Petteruti. All rights reserved.
//

import UIKit
import Cards

class SPCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var card: CardHighlight!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        //You Code here
    }
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
    }
    
}
