//
//  CategoryViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 28/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var barcode: String!
    var bookTitle: String!
    var condition: String!
    
    @IBOutlet weak var categoryPicker : UIPickerView!
    
    // Declare string array
    var pickerData: [String] = []
    
    @IBAction func confirmButton(_ sender: Any) {
        print("title=\(bookTitle)")
        
        print("barcode=\(barcode)")
        
        print("condition=\(condition)")
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject)
    {
        let row = categoryPicker.selectedRow(inComponent: 0)
        let selected = pickerData[row]
        
        let uiAlert = UIAlertController(
            title: "You selected \(selected)",
            message: "",
            preferredStyle: UIAlertControllerStyle.alert)
        
        uiAlert.addAction(UIAlertAction( title: "Close",
                                         style: .default,
                                         handler: nil))
        self.present(
            uiAlert, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.pickerData = [
        "Primary",
        "Secondary",
        "Tertiary"]
        
        super.init(coder: aDecoder)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Preview" {
            let previewVC = segue.destination as! PreviewViewController
            previewVC.barcode = barcode
            previewVC.bookTitle = bookTitle
            previewVC.condition = condition
            //you can get selected value on pickerview
            let category = String(pickerData[categoryPicker.selectedRow(inComponent: 0)])
            previewVC.category = category
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

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
