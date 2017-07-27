//
//  ISBN.swift
//  ShareATextbook
//
//  Created by ITP312 on 11/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class ISBN: NSObject {
   
    var id : String = ""
    var name : String = ""
    var publisher : String = ""
    var edition : String = ""
    var author : String = ""
    var cateid : String = ""
    
    init(id: String,
         name: String,
         publisher:String,
         edition: String,
         author:String,
         cateid: String){
        
        self.id = id
        self.name = name
        self.publisher = publisher
        self.edition = edition
        self.author = author
        self.cateid = cateid
        
        super.init()
    }
}
