//
//  ViewController.swift
//  ShareATextBookTest
//
//  Created by Ryuichi Chua on 23/6/17.
//  Copyright © 2017 Ryuichi Chua. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var passErrLblSix: UILabel!
    @IBOutlet weak var PassErrLblNum: UILabel!
    @IBOutlet weak var nameErrLbl: UILabel!
    @IBOutlet weak var nameField: DesignableTextField!
    @IBOutlet weak var passErrLbl: UILabel!
    @IBOutlet weak var phoneErrLbl: UILabel!
    @IBOutlet weak var emailErrLbl: UILabel!
    @IBOutlet weak var passField: DesignableTextField!
    @IBOutlet weak var emailField: DesignableTextField!
    @IBOutlet weak var phoneField: DesignableTextField!
    @IBOutlet weak var passButton: UIButton!
    
    var iconClick : Bool!
    
    @IBAction func buttonPressed(_ sender: Any) {
        createUser()
    }
    
    @IBAction func phoneTFVal(_ sender: DesignableTextField) {
        let phone = phoneField.text!
        
        if Validation.isValidPhone(testStr: phone) {
            phoneField.rightImage = UIImage(named: "checked")
            phoneErrLbl.text = ""
            textFieldHelper.removeErrorHighlightTextField(textField: phoneField)
        } else {
    
            phoneField.rightImage = UIImage(named: "valErr")
            phoneErrLbl.text = "Please enter a valid Phone Number"
            textFieldHelper.errorHighlightTextField(textField: phoneField)
        }
    }
    
    @IBAction func passTFVal(_ sender: DesignableTextField) {
        let pass = passField.text!
        
        
        if Validation.isValidPass(testStr: pass) {
            passField.rightImage = UIImage(named: "checked")
            passErrLblSix.textColor = UIColor(red: 0/255, green: 178/255, blue: 0/255, alpha: 1)
            passErrLbl.textColor = UIColor(red: 0/255, green: 178/255, blue: 0/255, alpha: 1)
            PassErrLblNum.textColor = UIColor(red: 0/255, green: 178/255, blue: 0/255, alpha: 1)
            textFieldHelper.removeErrorHighlightTextField(textField: passField)
        } else {
            passField.rightImage = UIImage(named: "valErr")
            textFieldHelper.errorHighlightTextField(textField: passField)
            
            if Validation.isValidPassUppercase(testStr: pass) {
                passErrLbl.textColor = UIColor(red: 0/255, green: 178/255, blue: 0/255, alpha: 1)
            } else {
                passErrLbl.textColor = UIColor.red
            }
            
            if Validation.isValidPassNum(testStr: pass) {
                PassErrLblNum.textColor = UIColor(red: 0/255, green: 178/255, blue: 0/255, alpha: 1)
            } else {
                PassErrLblNum.textColor = UIColor.red
            }
            
            if Validation.isValidPassSix(testStr: pass) {
                passErrLblSix.textColor = UIColor(red: 0/255, green: 178/255, blue: 0/255, alpha: 1)
            } else {
                passErrLblSix.textColor = UIColor.red
            }
        }
    }
    
    @IBAction func nameTFVal(_ sender: DesignableTextField) {
        
        let name = nameField.text!
        
        if Validation.isValidName(testStr: name) {
            nameField.rightImage = UIImage(named: "checked")
            nameErrLbl.text = ""
            textFieldHelper.removeErrorHighlightTextField(textField: nameField)
        } else {
            nameField.rightImage = UIImage(named: "valErr")
            nameErrLbl.text = "Please enter a valid Name"
            textFieldHelper.errorHighlightTextField(textField: nameField)
            
        }
        
    }
    
    @IBAction func emailTFVal(_ sender: DesignableTextField) {
        
        let email = emailField.text!
        
        if Validation.isValidEmail(testStr: email) {
            emailField.rightImage = UIImage(named: "checked")
            emailErrLbl.text = ""
            textFieldHelper.removeErrorHighlightTextField(textField: emailField)
        } else {
            emailField.rightImage = UIImage(named: "valErr")
            emailErrLbl.text = "Please enter a valid Email"
            textFieldHelper.errorHighlightTextField(textField: emailField)
        }
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
    
    // Move the text field in a pretty animation!
    func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconClick = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        }

}

