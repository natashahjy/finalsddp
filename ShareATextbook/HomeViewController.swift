 //
//  HOME.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 17/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var postingCollectionView: UICollectionView!
    
    var postList : [Posting] = []
    let numberOfCellsPerRow: CGFloat = 2.0
    let leftAndRightPaddings: CGFloat = 1.0
    
    func loadFeed() {
        PostingDataManager.listAllPostings(onComplete: {
            postings in
            
            self.postList = postings
            
            DispatchQueue.main.async {
                self.postingCollectionView.reloadData()
            }
            
        })
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.postList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = postingCollectionView.dequeueReusableCell(withReuseIdentifier: "postingCell", for: indexPath) as? PostingCollectionViewCell else { return UICollectionViewCell() }
        let post = postList[indexPath.row]
        cell.postingName!.text = post.name
        cell.postingTitle!.text = post.by
        cell.postingDate!.text = post.postdts
        cell.postingImg.image = UIImage(named: String(indexPath.row))
        cell.postingId = post.postingId
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        let layout = collectionViewLayout as! UICollectionViewFlowLayout
//        layout.minimumLineSpacing = 5.0
//        layout.minimumInteritemSpacing = 2.5
//        let numberOfItemsPerRow: CGFloat = 2.0
//        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
//
//        return CGSize(width: itemWidth, height: itemWidth)
//    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewWidth = postingCollectionView?.frame.width
        let collectionViewHeight = postingCollectionView?.frame.height
        let itemWidth = (collectionViewWidth! - leftAndRightPaddings) / numberOfCellsPerRow
        let layout = postingCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        self.postingCollectionView.contentInset = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
        self.postingCollectionView.scrollIndicatorInsets = UIEdgeInsets.zero
        //self.postingCollectionView.inset
        layout.itemSize = CGSize(width: itemWidth, height: collectionViewHeight!/2)
        loadFeed()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
