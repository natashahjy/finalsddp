//
//  RequestDataManager.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 2/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import Foundation

class RequestDataManager {
    
    class func requestPosting(token: String, postingId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "id" : postingId,
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/chat/request", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllMessageGroup(token: String, postingId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "all",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    
    class func getAllPendingMessageGroup(token: String, postingId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "all_pending",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllDononrMessageGroup(token: String, postingId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "donor",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    class func getAllRecipientMessageGroup(token: String, postingId: String) {
        
        let json = JSON.init([
            
            "token" : token,
            "role" : "recipient",
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/messagegroup/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
}
