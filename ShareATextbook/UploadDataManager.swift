//
//  UploadDataManager.swift
//  ShareATextbook
//
//  Created by ITP312 on 3/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//
// Linking fairprice api

import UIKit

class UploadDataManager: NSObject {
    
    class func loadUpload()
    {
        let url = "http://13.228.39.122/FP04_523746827346837/admin/#!/isbn"
        let json = JSON.init([])
        var uploadList : [Upload] = []
        
        HTTP.postJSON(
            url: url,
            json: json,
            onComplete:
            {
                json, response, error in
    
                if json == nil
                {
                    return
                }
                print(json!.count)
    
    
                for var i in 0 ..< json!.count
                {
                    var u = Upload()
                    u.title = json![i]["title"].string!
                    /*
                     e.name = json![i]["name"].string!
                     e.population = json![i]["pop"].int!
                     e.latitude = json![i]["latitude"].double!
                     e.longitude = json![i]["longitude"].double!
                     self.uploadList.append(e)
                     print(e.name)
                     */
                    
                     /*
                     “id” : “9783161484100”,
                     
                     “name” : “Primary 1 School Mathematics”,
                     
                     “limit” : “1”
                     */
                    uploadList.append(u)
                }
        })

    }
}
