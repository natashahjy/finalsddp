//
//  ISBNDataManager.swift
//  ShareATextbook
//
//  Created by ITP312 on 27/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ISBNDataManager: NSObject {

    class func isbn(id: String,
                    name: String,
                    limit: String,
                    onComplete: ((_ : [ISBN]) -> Void)?)
    {
        let url = "http://13.228.39.122/FP04_523746827346837/1.0/isbn/list"
        let json = JSON.init([
            "id" : id,
            "name" : name,
            "limit" : limit
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
                var isbnList : [ISBN] = []
                for var i in 0 ..< json!.count
                {
                    let isbnjson = json![i]
                    let isbn = ISBN(
                        id: isbnjson["id"].string!,
                        name: isbnjson["name"].string!,
                        publisher:isbnjson["publisher"].string!,
                        edition: isbnjson["edition"].string!,
                        author: isbnjson["author"].string!,
                        cateid: isbnjson["cateid"].string!)
                    isbnList.append(isbn)
                }
                onComplete?(isbnList)
        })

    }

}
