//
//  UITextField.swift
//  Hell Week
//
//  Created by Student on 2019-05-18.
//  Copyright © 2019 Student. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    @IBInspectable public var leftSpacer:CGFloat {
        get {
            if let l = leftView {
                return l.frame.size.width
            } else {
                return 0
            }
        } set {
            leftViewMode = .always
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
}
