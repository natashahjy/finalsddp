//
//  ConditionViewController.swift
//  ShareATextbook
//
//  Created by ITP312 on 28/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ConditionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var barcode: String!
    var bookTitle: String!
    
    @IBOutlet weak var conditionPicker : UIPickerView!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let row = conditionPicker.selectedRow(inComponent: 0)
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
    var pickerData: [String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.pickerData = [
            "Good as New",
            "Yellowed Pages Only",
            "Yellowed & Dog Ear Pages"]
        
        super.init(coder: aDecoder)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addCategory" {
            let categoryVC = segue.destination as! CategoryViewController
            categoryVC.barcode = barcode
            categoryVC.bookTitle = bookTitle
            //you can get selected value on pickerview
            let condition = String(pickerData[conditionPicker.selectedRow(inComponent: 0)])
            categoryVC.condition = condition
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
