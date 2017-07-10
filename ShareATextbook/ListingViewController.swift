//
//  ListingViewController.swift
//  ShareATextbook
//
//  Created by nat on 4/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ListingViewController: UIViewController {

    var barcode: String!
    var bookTitle: String!
    var condition: String!
    var category : String!
    
    var uploadList : [Upload] = []
    
    
    //declare json object
    let json = JSON.init([])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
         let url = "http://13.228.39.122/FP04_523746827346837/admin/#!/isbn"
         HTTP.postJSON(
            url: url,
            json: json,
            onComplete:
            {
                json, response, error in
            // this is what will happen after the download from server is complete
            if json == nil
            {
                return
            }
         
         print(json!.count)
         
            for var i in 0 ..< json!.count{
                /*
                 var u = Upload()
                 u.barcode = json![i]["id"].string!
                 u.title = json![i]["name"].string!
         
                 self.uploadList.append(u)
                 print(u.title)
                 */
            }
         
         })

    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete)
        {
            let upload = uploadList[(indexPath as NSIndexPath).row]
            
    //        DataManager.deleteUpload(upload: upload)
    //        uploadList = DataManager.loadUpload()
            
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
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
