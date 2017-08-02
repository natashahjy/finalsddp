//
//  PreviewViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 10/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController{
    
    var barcode: String!
    var bookTitle: String!
    var category : String!
    var desc: String!
    
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBAction func confirmButton(_ sender: Any) {
        print("title=\(bookTitle)")
        
        print("barcode=\(barcode)")
        
        print("category=\(category)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.barcodeLabel.text = barcode
        self.titleLabel.text = bookTitle
        self.categoryLabel.text = category
        self.descLabel.text = desc
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func upload(){
        UploadDataManager.upload(token: LoginGlobalVar.token, catID: category, bookTitle: titleLabel.text!, isbn: barcodeLabel.text!, desc: desc, author: "", publisher: "", edition: "", photos: "", preferredLoc: "")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Upload" {
          /*
            let uploadVC = segue.destination as! UploadViewController
            uploadVC.barcode = barcode
            uploadVC.bookTitle = bookTitle
            uploadVC.category = category
            */
            self.upload()
            var upload: Upload!
            upload.barcode = barcode
            upload.title = bookTitle
            upload.categoryID = category
            upload.author = "Mr Tan"
            upload.publisher = "Marshall Cavendish"
            upload.edition = "1"
            upload.desc = "Good as New"
            upload.preferredLocation = "NTUC Branch"
            upload.photo = ""
        }
    }

}
