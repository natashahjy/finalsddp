//
//  CategoryDataManager.swift
//  ShareATextbook
//
//  Created by ITP312 on 27/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class CategoryDataManager: NSObject {
    class func category(limit: Int,
                        name: String,
                        heading: String,
                        onComplete: ((_ : [Category]) -> Void)?)
    {
        let url = "http://13.228.39.122/FP04_523746827346837/1.0/category/list"
        let json = JSON.init([
            "limit" : limit,
            "name" : name,
            "heading" : heading
            ])
        
        HTTP.postJSON(
            url: url,
            json: json, onComplete:
            {
                json, response, error in
                if json == nil
                {
                    return
                }
                print(json!)
                var categoryList : [Category] = []
                for var i in 0 ..< json!.count
                {
                    let categoryjson = json![i]
                    let category = Category(
                        id: categoryjson["id"].string!,
                        displayOrder: categoryjson["displayorder"].string!,
                        heading: categoryjson["heading"].string!,
                        name: categoryjson["name"].string!)
                    categoryList.append(category)
                }
                onComplete?(categoryList)
        })
        
    }

}
