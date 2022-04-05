//
//  UILabel + Extension.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 04.04.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, textColor: UIColor) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
    }
    
}
