//
//  DesignableSegmentedControl.swift
//  ShareATextbook
//
//  Created by Ryuichi Chua on 2/8/17.
//  Copyright © 2017 natashahjy. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableSegmentedControl: UIControl {

    var buttons = [UIButton]()
    var selector: UIView!
    var selectedSegmentIndex = 0
    
    @IBInspectable
    var borderWidth:CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColour :UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColour.cgColor
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitles : String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColour: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColour: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
  
    @IBInspectable
    var selectorTextColour: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach {
            $0 .removeFromSuperview()
        }
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles {
            let button = UIButton(type:  .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColour, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColour , for: .normal)
        
        let selectorWidth = (frame.width + 40) / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: (frame.height - 6), width: selectorWidth, height: 6))
        selector.backgroundColor = selectorColour
        addSubview(selector)
        
        let sv = UIStackView(arrangedSubviews: buttons)
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        sv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        sv.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        sv.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    func buttonTapped(button: UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColour, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                print(selectedSegmentIndex)
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                
                btn.setTitleColor(selectorTextColour, for: .normal )
            }
        }
        sendActions(for: .valueChanged)
    }
}
