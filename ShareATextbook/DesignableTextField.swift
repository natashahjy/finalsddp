//
//  DesignableTextField.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 28/6/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            
            var width = leftPadding + 20
            
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
 
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
            view.addSubview(imageView)
            
            leftView = view
        } else {
            // image is nill
            leftViewMode = .never
        }
        
        if let image = rightImage {
            rightViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: rightPadding, y: 0, width: 20, height: 20))
            imageView.image = image
            imageView.tintColor = tintColor
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            view.addSubview(imageView)
            
            rightView = view
        } else {
            // image is nill
            rightViewMode = .never
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "",
                    attributes: [NSForegroundColorAttributeName: tintColor])
    }
}
