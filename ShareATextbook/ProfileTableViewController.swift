//
//  ProfileTableViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 5/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController{
    
//    var postList : [Posting] = []
//    var user: User
//    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! ProfileViewTableViewCell
            
            return cell
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "postTableCell", for: indexPath) as! PostingTableViewCell
            return cell
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1 {
            if let cell = cell as? PostingTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.reloadData()
            }
        }
    }
    
}

extension ProfileTableViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! ProfilePostCollectionViewCell
        
        return cell
    }
    
}
