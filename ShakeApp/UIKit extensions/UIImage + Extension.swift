//
//  UIImage + Extension.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 04.04.2022.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode, cornerRadius: Double, borderColor: CGColor, borderWidth: Double) {
        self.init()
        self.image = image
        self.clipsToBounds = true
        self.contentMode = contentMode
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor
        self.layer.borderWidth = borderWidth
    }
}
