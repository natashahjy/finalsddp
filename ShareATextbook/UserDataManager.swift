//
//  UserDataManager.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 5/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import Foundation

class UserDataManager {
    
    class func getUser(token: String, userId: String,  onComplete: ((_: (User) -> Void)?) ) {
        
        let json = JSON.init([
            
            "token" : token,
            "id" : userId,
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/get", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                    let user = User()
                    user.id = ((json!["id"].string)!)
                    user.name = ((json!["name"].string)!)
                    user.photo = ((json!["photo"].string)!)
                    user.email = ((json!["email"].string)!)
                    
                    if (json!["phone"]).exists() {
                        user.phone = ((json!["phone"].string)!)
                    } else {
                        user.phone = "NIL"
                    }
                    
                    if (json!["showemail"]).exists() {
                        user.showEmail = ((json!["showemail"].string)!)
                    } else {
                        user.showPhone = "NIL"
                    }
                    
                    if (json!["showphone"]).exists() {
                        user.showEmail = ((json!["showphone"].string)!)
                    } else {
                         user.showEmail = "NIL"
                    }
                    
                    if (json!["preferredloc"]).exists() {
                        user.preferredloc = ((json!["preferredloc"].string)!)
                    } else {
                        user.preferredloc = "Bukit Panjang"
                    }
        
//                    user.joineddt = ((json!["joineddt"].string)!)
                    user.joinedDate = ((json!["joineddts"].string)!)
                    
                    onComplete!(user)
                }
                    
            })
        
        return
        } // End of Dispatch Queue
    
    }
    
    
    class func userLogout(token: String, userId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "userid" : userId,
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/user/logout", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
}
