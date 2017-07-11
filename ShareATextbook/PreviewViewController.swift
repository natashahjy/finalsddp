//
//  PreviewViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 10/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {

    var barcode: String!
    var bookTitle: String!
    var condition: String!
    var category : String!
    
    @IBOutlet weak var barcodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Upload" {
            let uploadVC = segue.destination as! UploadViewController
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
