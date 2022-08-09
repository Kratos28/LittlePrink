//
//  Protocols.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/17.
//

import Foundation


protocol ChannelVCDelegate {
    /// 用户从选择话题页面返回编辑笔记页面传值用
    ///  - Parameter channel: fff
    ///  - Parameter subChannel: fff
    ///  - Return
    func updateChannel(channel:String,subChannel:String)
    
}

protocol POIVCDelegate
{
    func updatePOIName( _ poiName: String);
}
