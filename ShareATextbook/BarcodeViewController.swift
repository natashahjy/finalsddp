//
//  BarcodeViewController.swift
//  ShareATextbook
//
//  Created by nat on 8/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class BarcodeViewController: UIViewController {
    @IBOutlet weak var barcodeTextField : UITextField!
    
    var uploadItem : Upload!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func prepareForSegue(segue:UIStoryboardSegue, sender:Any?) {
        if(segue.identifier == "addDetails"){
            let detailsVC = (segue.destination as! DetailsViewController)
            detailsVC.barcode = barcodeTextField.text
        }
    }
}
