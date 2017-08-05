//
//  PopUpViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 5/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    @IBOutlet weak var popUpView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        popUpView.layer.cornerRadius = 10
        popUpView.layer.masksToBounds = true
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
