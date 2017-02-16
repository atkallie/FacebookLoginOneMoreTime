//
//  FancyTextField.swift
//  Socializer
//
//  Created by Ahmed T Khalil on 2/15/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit

@IBDesignable
class FancyTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBorder()
        setShadow()
        layer.cornerRadius = 5.0 //corner radius for textfield
        layer.masksToBounds = false //if you don't set to false, then the shadows don't show
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setBorder()
        setShadow()
        layer.cornerRadius = 5.0 //corner radius for textfield
        layer.masksToBounds = false //if you don't set to false, then the shadows don't show
    }
    
    func setBorder(){
        layer.borderColor = UIColor(colorLiteralRed: 33.0/255.0, green: 150.0/255.0, blue: 243.0/255.0, alpha: 0.8).cgColor
        layer.borderWidth = 0.5
    }
    
    //edits the inset of the text field (affects placeholder text)
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5.0, dy: 0.0)
    }
    
    //edits the inset of the editable text field (affects input text)
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5.0, dy: 0.0)
    }
    
    //set shadow for text field
    func setShadow(){
        //set the shadow properties
        layer.shadowColor = UIColor(colorLiteralRed: 122.0/255.0, green: 122.0/255.0, blue: 122.0/255.0, alpha: 0.8).cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
}
