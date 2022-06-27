//
//  Extension.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/18.
//

import Foundation

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
