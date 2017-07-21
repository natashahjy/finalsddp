//
//  DetailsViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 28/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var barcode: String!
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var coverPhoto: UIImageView!
    
    @IBAction func confirmButton(_ sender: Any) {
        
        print("title=\(titleTextField.text)")
        
        print("barcode=\(barcode)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCondition" {
            let conditionVC = segue.destination as! ConditionViewController
            conditionVC.barcode = barcode
            conditionVC.bookTitle = titleTextField.text
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
