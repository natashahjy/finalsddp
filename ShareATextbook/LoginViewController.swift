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
    
    @IBAction func fbLoginButton(_ sender: Any) {
        FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile"], from: self)
        { (result, error) in
            if error != nil {
                print("FB Login failed:", error!)
                return
            }
            
            let socialToken = result?.token.tokenString
            print(socialToken)
            
            let json = JSON.init([
                "type" : "F",
                "token" : socialToken
                ])
            
            DispatchQueue.global(qos: .background).async{
                HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/login", json: json, onComplete: {
                    json, response, error in
                    
                    if json != nil {
//                        print(error!)
                        print(response!)
                        print(json!)
                    }
                    
                })
            } // End of Dispatch Queue
            
        }
        
    }
    
    // get nonce before calling user/login endpoint
    func emailLogin() {
        
        let email = emailTF.text!
        var pass = passTF.text!
        
        if Validation.loginScreen(email: email, pass: pass) {
            
            print(LoginDataManager.loginUser(email: email, pass: pass))
          
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
