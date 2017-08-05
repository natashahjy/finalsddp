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
    var user: User?
    
    func loadFeed() {
        PostingDataManager.listAllUserPostings(userId: LoginGlobalVar.userId, onComplete: {
            postings in
            
            self.postList = postings
            self.postList.reverse()
            
            DispatchQueue.main.async {
                self.userPostCollectionView.reloadData()
            }
            
        })
    }
    
    func getUser() {
        UserDataManager.getUser(token: LoginGlobalVar.token, userId: LoginGlobalVar.userId, onComplete: {
            user in
            self.user = user
            print(user.name)
        })
    }
    
    @IBAction func logOut(_ sender: Any) {
        UserDataManager.userLogout(token: LoginGlobalVar.token, userId: LoginGlobalVar.userId)
        self.performSegue(withIdentifier: "logOut", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.postList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = userPostCollectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as? ProfilePostCollectionViewCell else { return UICollectionViewCell() }
        let post = postList[indexPath.row]
        cell.status.text = post.status
        
        if post.status == "Available" {
            cell.status.backgroundColor = UIColor.init(red: 0/255, green: 128/255, blue: 128/255, alpha: 1)
        } else if post.status == "Donated" {
            cell.status.backgroundColor = UIColor.init(red: 204/255, green: 60/255, blue: 60/255, alpha: 1)
        } else {
            cell.status.backgroundColor = UIColor.init(red: 153/255, green: 153/255, blue: 153/255, alpha: 1)
        }
        
        return cell
    }

    override func viewDidLoad() {
        loadFeed()
        getUser()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
