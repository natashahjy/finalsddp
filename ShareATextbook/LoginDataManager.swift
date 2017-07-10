//
//  LoginDataManager.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 10/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class LoginDataManager {
    
    class func loginUser(email: String, pass: String) -> Bool{
        
        var isLogin = false
        var token = ""
        var userId = ""
        
        let json = JSON.init([
            "email" : email
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/getnonce", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    print(json!)
                    
                    let nonce = (json!["nonce"].string)
                    let encryptPass = SHA512.sha512Hex(string: (SHA512.sha512Hex(string: pass).uppercased() + nonce!)).uppercased()
                
                    let loginJson = JSON.init([
                        "type" : "E",
                        "email" : email,
                        "password" : encryptPass
                        ])
                    
                    
                    HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/login", json: loginJson, onComplete: {
                        json, response, error in
                        
                        if json != nil {
                            print(json!)
                            
                            if (json?["error"].exists())! {
                                isLogin = false
                                print("LOGIN FAIL")
                            }
                            
                            else {
                                isLogin = true
                                token = (json!["token"].string)!
                                userId = (json!["userid"].string)!
                                print(token)
                                print(userId)
                            }
                            // let saveToken: Bool = KeychainWrapper.standard.set(token, forKey: "sessionToken")
                            // let saveUserId: Bool = KeychainWrapper.standard.set(userId, forKey: "userid")
                            return
                        }
                        print(isLogin)
                    })
                    return
                }
            })
            
        } // End of Dispatch Queue
        
        return isLogin
    }
    
}
