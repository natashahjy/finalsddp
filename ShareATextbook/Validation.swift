//
//  Validation.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 4/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import Foundation

class Validation {
    
    class func validateForm (name: String, email: String, phoneNum: String) -> Bool {
    
        var validate = false
        
        if isValidName(testStr: name) && isValidEmail(testStr: email) && isValidPhone(testStr: phoneNum)
        {
         validate = true
            print("OK")
        }
    
        return validate
    }
   
    class func loginScreen (email: String, pass: String) -> Bool {
        
        var validate = false
        
        if  isValidEmail(testStr: email) {
            validate = true
        }
        return validate
    }
    
    static private let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static private let regexNameType = "^[a-zA-Z]+$"
    static private let regexPhoneType = "^[9|8][0-9]{7}$"
    static private let regexPass = "^(?=.*[A-Z])(?=.*[0-9]).{8}$"
    
    class func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if emailTest.evaluate(with: testStr) {
            
        }
        
        return emailTest.evaluate(with: testStr)
    }
   
    class func isValidName(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        
        let nameTest = NSPredicate(format:"SELF MATCHES %@", regexNameType)
        return nameTest.evaluate(with: testStr)
    }
    
    class func isValidPhone(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        
        let phoneTest = NSPredicate(format:"SELF MATCHES %@", regexPhoneType)
        return phoneTest.evaluate(with: testStr)
    }
    
    class func isValidPass(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        
        let passTest = NSPredicate(format:"SELF MATCHES %@", regexNameType)
        return passTest.evaluate(with: testStr)
    }
    
}
