//
//  Category.swift
//  ShareATextbook
//
//  Created by ITP312 on 25/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class Category: NSObject {

    var id : String = ""
    var displayOrder : String = ""
    var heading: String = ""
    var name : String = ""
    
    init(id: String, displayOrder: String, heading: String, name:String){
        self.id = id
        self.displayOrder = displayOrder
        self.heading = heading
        self.name = name
        
        super.init()
    }
}
