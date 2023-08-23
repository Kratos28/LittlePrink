//
//  MeVC-EditOrFllow.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/23.
//

import LeanCloud
extension MeVC
{
    @objc func editOrFllow(){
        if isMySelf
        {
            
        }else
        {
            if let _ = LCApplication.default.currentUser{
                print("关注和取消关注功能");
            }else {
                showLoginHUD();
            }
        }
    }
}
