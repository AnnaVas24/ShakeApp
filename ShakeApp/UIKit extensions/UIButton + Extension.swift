//
//  UIButton + Extension.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 05.04.2022.
//

import UIKit

extension UIButton {
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     borderColor: CGColor) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = .futura20()
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 3
        self.layer.borderColor = borderColor
    }
}
