//
//  textFieldHelper.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 30/7/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

class textFieldHelper : UIViewController{
    
    class func errorHighlightTextField(textField: UITextField){
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 5
    }
    
    class func highlightSelectedTextField(textfield: UITextField){
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 1
        textfield.layer.cornerRadius = 5
    }
    
    class func removeErrorHighlightTextField(textField: UITextField){
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 0
        textField.layer.cornerRadius = 5
    }
    
//    // Start Editing The Text Field
//    class func textFieldDidBeginEditing(_ textField: UITextField) {
//        moveTextField(textField, moveDistance: -250, up: true)
//    }
//    
//    // Finish Editing The Text Field
//    class func textFieldDidEndEditing(_ textField: UITextField) {
//        moveTextField(textField, moveDistance: -250, up: false)
//    }
//    
//    // Hide the keyboard when the return key pressed
//    class func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    // Move the text field in a pretty animation!
//    class func moveTextField(_ textField: UITextField, moveDistance: Int, up: Bool) {
//        let moveDuration = 0.3
//        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
//        
//        UIView.beginAnimations("animateTextField", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(moveDuration)
//        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
//        UIView.commitAnimations()
//    }
    
}
