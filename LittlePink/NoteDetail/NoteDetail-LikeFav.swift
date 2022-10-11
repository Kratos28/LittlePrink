//
//  NoteDetail-LikeFav.swift
//  LittlePink
//
//  Created by K on 2022/10/11.
//

import Foundation
import LeanCloud
extension NoteDetailVC
{
    func like()
    {
        if let user = LCApplication.default.currentUser{
            
        }else
        {
            showTextHUD("请先登录");
        }
    }
    func  fav()
    {
        if let user = LCApplication.default.currentUser{
            
        }else
        {
            showTextHUD("请先登录");
        }
    }
}
