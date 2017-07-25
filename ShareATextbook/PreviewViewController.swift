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
    var condition: String!
    var category : String!
    
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    @IBAction func confirmButton(_ sender: Any) {
        print("title=\(bookTitle)")
        
        print("barcode=\(barcode)")
        
        print("condition=\(condition)")
        
        print("category=\(category)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.barcodeLabel.text = barcode
        self.titleLabel.text = bookTitle
        self.categoryLabel.text = category
        self.conditionLabel.text = condition
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Upload" {
            let uploadVC = segue.destination as! UploadViewController
            uploadVC.barcode = barcode
            uploadVC.bookTitle = bookTitle
            uploadVC.category = category
            
            var upload: Upload!
            upload.barcode = barcode
            upload.title = bookTitle
            upload.categoryID = category
            
        }
    }

}
