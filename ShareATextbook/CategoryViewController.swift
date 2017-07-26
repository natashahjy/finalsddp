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
    @IBOutlet weak var nextButton : UIButton!
    
    // Declare string array
    var pickerData: [String] = []
    var categoryList: [Category] = []
    
    @IBAction func confirmButton(_ sender: Any) {
        print("title=\(bookTitle)")
        
        print("barcode=\(barcode)")
        
        print("condition=\(condition)")
        
    }
    
    func loadCategory()
    {
        UploadDataManager.category(limit: 10, name: "", heading: "", onComplete:
        {
            categoryList in
            
            self.categoryList = categoryList
        
            DispatchQueue.main.async
            {
                    self.categoryPicker.reloadAllComponents()
                    self.nextButton.isEnabled = true
            }
        })
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryList[row].name
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadCategory()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Preview" {
            let previewVC = segue.destination as! PreviewViewController
            previewVC.barcode = barcode
            previewVC.bookTitle = bookTitle
            previewVC.condition = condition
            //you can get selected value on pickerview
            let category = String(categoryList[categoryPicker.selectedRow(inComponent: 0)].name)
            previewVC.category = category
        }
    }

}
