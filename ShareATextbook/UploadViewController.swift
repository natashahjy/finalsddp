//
//  UploadViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 6/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class UploadViewController: UIViewController, UITableViewDelegate {
    
    var barcode: String!
    var bookTitle: String!
    var condition: String!
    var category : String!
    
    // Preview tableView
    var uploadList : [Upload] = []
    
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        /*
        uploadList.append(Upload(barcode: "159-087-632",
                                 category: "Primary",
                                 title: "My Pals are Here Primary 1 Maths",
                                 condition: "Good as New",
                                 tag: "PrimaryOne"))
        */
        
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PreviewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return uploadList.count
    }
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        var cell :  PreviewCell = tableView.dequeueReusableCell(withIdentifier: "PreviewCell", for: indexPath) as! PreviewCell
//        
//        let p = uploadList[indexPath.row]
//        
//        cell.barcodeLabel?.text = p.barcode
//        // cell.barcodeLabel?.text = barcode
//        cell.categoryLabel?.text = p.category
//        cell.titleLabel?.text = p.title
//        cell.conditionLabel?.text = p.condition
//        cell.tagLabel?.text = p.tag
//        
//        return cell
//    }

    func prepareForSegue(segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Upload" {
            let uploadVC = segue.destination as! ListingViewController
            
            uploadVC.barcode = barcode
            uploadVC.bookTitle = bookTitle
            uploadVC.condition = condition
            uploadVC.category = category
        }
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
