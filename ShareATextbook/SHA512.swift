//
//  SHA512.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 4/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class SHA512 {

    // Encrypt Password w SHA512
    class func sha512Hex(string: String) -> String {
        let data = string.data(using: .utf8)!
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA512_DIGEST_LENGTH))
        
        data.withUnsafeBytes({
            _ = CC_SHA512($0, CC_LONG(data.count), &digest)
        })
        
        var digestHex = ""
        for index in 0..<Int(CC_SHA512_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        
        return digestHex
    }
    

}
