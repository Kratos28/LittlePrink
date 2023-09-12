//
//  UIView-Extensions.swift
//  LittlePink
//
//  Created by 9130Game on 2023/9/12.
//

import Foundation

extension UIView{
    @IBInspectable
    var radius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            clipsToBounds = true;
            layer.cornerRadius = newValue
        }
    }
}
