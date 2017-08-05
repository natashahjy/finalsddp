//
//  PhotoDataManager.swift
//  ShareATextbook
//
//  Created by nat on 6/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class PhotoDataManager: NSObject {

    class func addphoto(token: String,
                        file: String)
    {
        let url = "http://13.228.39.122/FP04_523746827346837/1.0/photos/addu"
        let json = JSON.init([
            "token" : token,
            "file" : file
            ])
        
        HTTP.postJSON(url: url, json: json,
                      onComplete: {
                        json, response, error in
                        
                        if json == nil
                        {
                            return
                        }
                        print(json!)
        })
    }
}
