//
//  FancyButton.swift
//  Socializer
//
//  Created by Ahmed T Khalil on 2/15/17.
//  Copyright © 2017 kalikans. All rights reserved.
//

import UIKit

@IBDesignable
class FancyButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setShadow()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setShadow()
    }
    
    func setShadow(){
        //set the shadow properties
        layer.shadowColor = UIColor(colorLiteralRed: 122.0/255.0, green: 122.0/255.0, blue: 122.0/255.0, alpha: 0.7).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    }
    
}
