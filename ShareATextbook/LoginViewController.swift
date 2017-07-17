//
//  LoginViewController.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 30/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController{

    @IBOutlet weak var emailTF: DesignableTextField!
    @IBOutlet weak var passTF: DesignableTextField!
    @IBAction func registerBtn(_ sender: Any) {
    }
    @IBAction func signInBtn(_ sender: Any) {
        emailLogin()
    }
 
    func emailLogin () {
        
        let email = emailTF.text!
        var pass = passTF.text!
        
        if Validation.loginScreen(email: email, pass: pass) {
            
                LoginDataManager.loginUser(email: email, pass: pass, onComplete: {
                    (token, userId, isLogin) -> Void in
                    
                    LoginGlobalVar.token = token
                    LoginGlobalVar.userId = userId
                    
                    if (isLogin) {
                        DispatchQueue.main.async() {
                            [unowned self] in
                           self.performSegue(withIdentifier: "login", sender: self)
                        }
                    }
            })
        }
    }
    
    @IBAction func fbLoginButton(_ sender: Any) {
        
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self)
        { (result, error) in
            if error != nil {
                print("FB Login failed:", error!)
                return
            }
            
            let socialToken = result?.token.tokenString
            print(socialToken)
        
                LoginDataManager.socialLogin(socialToken: socialToken!, onComplete: {
                   (token, userId, isLogin) -> Void in
                    
                    LoginGlobalVar.token = token
                    LoginGlobalVar.userId = userId
                    
                    if (isLogin) {
                        DispatchQueue.main.async() {
                            [unowned self] in
                            self.performSegue(withIdentifier: "login", sender: self)
                        }
                    }
                    
                })
                
            
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
