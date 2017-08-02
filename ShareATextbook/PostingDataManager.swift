//
//  postingsDummy.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 31/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import Foundation

class PostingDataManager {
    
    
    class func createPostings(token: String) {
        
        let json = JSON.init([
    
            "token" : token,
            
            "cateid" : ["bc501cd0-ecb7-484f-8d6f-a8a21fe5f942", "ab97a4f7-5a97-4080-ba89-a65a12d27263"],
            
            "name" : "Mathematics for Primary 1",
            
            "isbn" : "159-087-632",
            
            "desc" : "Brand-new book. First edition. Condition: 10",
            
            "author" : "ABC",
            
            "publisher" : "Great Publishing Pte Ltd",
            
            "edition" : "1997",
            
            "photos": ["84932"],
            
            "preferredloc" : "Yio Chu Kang MRT"
            
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/posting/add", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }
    
    
    class func listAllPostings(onComplete: ((_: [Posting]) -> Void)?) {
        
        let json = JSON.init([
            
            "search" : "",
            
            "catid" : "",
            
            "userid" : "",
            
            "page" : "0",
            
            "isavailable" : "",
            
            "limit" : "12",
            
            "orderbypostdt" : "asc"
            
            ])
        
        DispatchQueue.global(qos: .background).async{
            HTTP.postJSON(url: "http://13.228.39.122/FP04_523746827346837/1.0/posting/list", json: json, onComplete: {
                json, response, error in
                
                if json != nil {
                    print(json!)
                    let count = json!.count
                    var postingList: [Posting] = []
                    
                    for var i in 0 ..< count {
                        let post = Posting()
                        post.name = ((json![i]["name"].string)!)
                        post.by = (json![i]["by"].string)!
                        post.postdts = (json![i]["postdts"].string)!
                        post.postingId = (json![i]["id"].string)!
//                        post.image = (json![i]["photos"].string)!
                        
                        postingList.append(post)
                    }
                    onComplete?(postingList)
                }
                
            })
            
            return
        } // End of Dispatch Queue
        
    }

    
}
