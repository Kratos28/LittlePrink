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

extension Date {

    /// 获取当前 秒级 时间戳 - 10位
    var timestamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timestamp = Int(timeInterval)
        return "\(timestamp)"
    }

    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
}


