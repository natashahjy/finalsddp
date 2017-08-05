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
                    user.phone = ((json!["phone"].string)!)
                    user.showEmail = ((json!["showemail"].string)!)
                    user.showPhone = ((json!["showphone"].string)!)
                    user.preferredloc = ((json!["preferredloc"].string)!)
                    user.joineddt = ((json!["joineddt"].string)!)
                    user.joinedDate = ((json!["joineddts"].string)!)
                    
                    onComplete!(user)
                }
                    
            })
        
        return
        } // End of Dispatch Queue
    
    }
}
