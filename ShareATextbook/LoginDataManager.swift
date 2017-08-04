//
//  LoginDataManager.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 10/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginDataManager {
    
    class func loginUser(email: String, pass: String, onComplete: @escaping (String, String, Bool) -> Void){
        
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
                    
                    if (json?["error"].exists())! {
                        isLogin = false
                        token = "loginFail"
                        userId = "loginFail"
                        onComplete(token, userId, isLogin)
                    }
                    
                    else {
                        
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
                                    token = "loginFail"
                                    userId = "loginFail"
                                    onComplete(token, userId, isLogin)
                                }
                                    
                                else {
                                    isLogin = true
                                    token = (json!["token"].string)!
                                    userId = (json!["userid"].string)!
                                    onComplete(token, userId, isLogin)
                                }
                                return
                            }
                        })
                        
                    }
            
                    return
                }
            })
            
        } // End of Dispatch Queue
    }
    
    class func socialLogin(socialToken: String, onComplete: @escaping (String, String, Bool) -> Void) {
        
        var isLogin = false
        var token = ""
        var userId = ""
        
        let json = JSON.init([
            "type" : "F",
            "token" : socialToken
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/login", json: json, onComplete: {
                json, response, error in
                
                if (json?["error"].exists())! {
                    isLogin = false
                    token = "loginFail"
                    userId = "loginFail"
                    onComplete(token, userId, isLogin)
                }
                    
                else {
                    isLogin = true
                    token = (json!["token"].string)!
                    userId = (json!["userid"].string)!
                    onComplete(token, userId, isLogin)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
}
