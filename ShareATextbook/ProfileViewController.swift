//
//  ProfileViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 5/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var userPostCollectionView: UICollectionView!
    
    var postList : [Posting] = []
    
    func loadFeed() {
        PostingDataManager.listAllUserPostings(userId: LoginGlobalVar.userId, onComplete: {
            postings in
            
            self.postList = postings
            
            DispatchQueue.main.async {
                self.userPostCollectionView.reloadData()
            }
            
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.postList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = userPostCollectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as? ProfilePostCollectionViewCell else { return UICollectionViewCell() }
        let post = postList[indexPath.row]
        cell.status.text = post.status
        return cell
    }

    override func viewDidLoad() {
        loadFeed()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
