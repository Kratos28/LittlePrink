//
//  Protocol.swift
//  FJP
//
//  Created by K on 2022/10/25.
//

import Foundation
import UIKit
let kFQBackLabel: UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "kFQbackLabel".hashValue)

extension UIView
{
     var context:Any?{
            
            get{
                return objc_getAssociatedObject(self,kFQBackLabel)
            }
            set(newValue){
                objc_setAssociatedObject(self, kFQBackLabel, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
}



