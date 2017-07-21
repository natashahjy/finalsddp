//
//  ViewController.swift
//  ShareATextBookTest
//
//  Created by Ryuichi Chua on 23/6/17.
//  Copyright © 2017 Ryuichi Chua. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameField: DesignableTextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var passButton: UIButton!
    
    var iconClick : Bool!
    
    @IBAction func buttonPressed(_ sender: Any) {
        createUser()
    }

    @IBAction func iconPressed(_ sender: Any) {
        
        if(iconClick == true) {
            passField.isSecureTextEntry = true
            passButton.setImage(UIImage(named: "show")?.withRenderingMode(.alwaysOriginal), for: .normal)
            iconClick = false
        } else {
            passField.isSecureTextEntry = false
            passButton.setImage(UIImage(named: "hide")?.withRenderingMode(.alwaysOriginal), for: .normal)
            iconClick = true
        }

    }
    
    // Create a user via Email
    func createUser() {
        
        let name = nameField.text!
        var password = passField.text!
        let email = emailField.text!
        let phoneNum = phoneField.text!
        
        if Validation.validateForm(name: name, email: email, phoneNum: phoneNum) {
            
            password = SHA512.sha512Hex(string: passField.text!).uppercased()
            let registerUser = RegisterDataManager.registerUser(name: name, email: email, password: password, phoneNum: phoneNum)
            

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconClick = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        }

}

