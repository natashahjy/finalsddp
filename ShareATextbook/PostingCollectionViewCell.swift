//
//  PostingCollectionViewCell.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 1/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class PostingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var postingDate: UILabel!
    @IBOutlet weak var postingName: UILabel!
    @IBOutlet weak var postingTitle: UILabel!
    @IBOutlet weak var postingImg: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var postingId: String = ""
    
    @IBAction func reserveButton(_ sender: Any){
        RequestDataManager.requestPosting(token: LoginGlobalVar.token, postingId: postingId)
    }
}
