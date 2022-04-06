//
//  UITextField + Extension.swift
//  ShakeApp
//
//  Created by Vasichko Anna on 04.04.2022.
//

import UIKit
class CustomizedTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        font = .systemFont(ofSize: 18)
        clearButtonMode = .whileEditing
        borderStyle = .none
        layer.cornerRadius = 20
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = #colorLiteral(red: 0.3961000144, green: 0.3227356672, blue: 0.6102760434, alpha: 1)
     
        leftView?.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        leftViewMode = .always
        textColor = #colorLiteral(red: 0.3961000144, green: 0.3227356672, blue: 0.6102760434, alpha: 1)
        
        heightAnchor.constraint(equalToConstant: 45).isActive = true
        widthAnchor.constraint(equalToConstant: 330).isActive = true

    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 20
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 50, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 50, dy: 0)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.insetBy(dx: 50, dy: 0)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CustomizedTextField {
    convenience init(placeholder: String, image: UIImage) {
        self.init()
        
        let image = UIImageView(image: image)
        image.tintColor = #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1)
        self.leftView = image
        
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9956253171, green: 0.8003302217, blue: 0.4983468056, alpha: 1)])
    }
}
