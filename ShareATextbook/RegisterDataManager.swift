//
//  RegisterDataManager.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 5/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class RegisterDataManager {

    class func registerUser(name: String, email: String, password: String, phoneNum: String) -> Bool {
        
        var isRegistered = false
        
        let json = JSON.init([
            "name" : name,
            "email" : email,
            "password" : password,
            "phone" : phoneNum,
            "type" : "E",
            "showemail" : "true",
            "showphone" : "true"
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/add", json: json, onComplete: {
                json, response, error in
                
                if response != nil
                {
                    print(response!)
                    print(json!)
                    return
                }
                
                isRegistered = true
                
            })
        } // End of Dispatch Queue
        
        return isRegistered
    }

}
