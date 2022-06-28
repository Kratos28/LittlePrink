//
//  Extension.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/18.
//

import Foundation
import UIKit


extension UIView
{
    @IBInspectable  var  cornerRadius : CGFloat{
        set{
            self.layer.cornerRadius = newValue;
        }
        get{
            return self.layer.cornerRadius;
        }
    }
}


extension Bundle{
    var appName :String {
        
        if  let appname =  localizedInfoDictionary?["CFBundleDisplayName"] as? String
         {
            return appname;
         }else
         {
             return infoDictionary!["CFBundleDisplayName"] as! String;
         }

    }
}

