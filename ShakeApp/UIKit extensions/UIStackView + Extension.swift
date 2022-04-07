//
//  UIStackView + Extension.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 06.04.2022.
//

import UIKit

extension UIStackView {
    
    convenience init(arrangeSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangeSubviews)
        self.axis = axis
        self.spacing = spacing
        
    }
}
