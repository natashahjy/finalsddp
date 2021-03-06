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
    @IBOutlet weak var sizeSegment: UISegmentedControl!
    @IBOutlet var scanButton:UIButton!
    
    var barcodeScanner:BarcodeScannerViewController?
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "addDetails"){
            let detailsVC = (segue.destination as! DetailsViewController)
            detailsVC.barcode = barcodeTextField.text
        }
    }
    
    @IBAction func scanClicked() {
        barcodeScanner?.barcodeScanned =
        {
            (barcode:String) in
        _ = self.navigationController?.popViewController(animated: true)
        print("Received following barcode: \(barcode)")
        
            DispatchQueue.main.async {
                self.barcodeTextField.text = "\(barcode)"
            }
        }
        
        if let barcodeScanner = self.barcodeScanner {
            self.navigationController?.pushViewController(barcodeScanner, animated: true)
        }
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        
        print("barcode=\(barcodeTextField.text)")
        
    }
    
    @IBAction func segmentChanged(sender: Any)
    {
        if (sizeSegment.selectedSegmentIndex == 0)
        {
            let storyboard = UIStoryboard(name: "Favourites", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
            
            self.present(controller, animated:true, completion:nil)
        }
        
        if (sizeSegment.selectedSegmentIndex == 1)
        {
            let storyboard = UIStoryboard(name: "Home", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "InitialController") as UIViewController
            
            self.present(controller, animated:true, completion:nil)
        }
        
        if (sizeSegment.selectedSegmentIndex == 2)
        {
            let storyboard = UIStoryboard(name: "Upload", bundle: nil)
            let navcontroller = storyboard.instantiateViewController(withIdentifier: "NavViewController") as UIViewController
            
            self.present(navcontroller, animated:true, completion:nil)
            
        }
    }
}
