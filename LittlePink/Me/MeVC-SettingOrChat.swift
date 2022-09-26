//
//  MeVC-SettingOrChat.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/3.
//

import LeanCloud

extension MeVC{
    @objc func settingOrChat(){
        if isMySelf{//设置
            
            let settingTableVC = storyboard!.instantiateViewController(identifier: kSettingTableVCID) as! SettingTableVC
            settingTableVC.user = user
            present(settingTableVC, animated: true)
            
        }else{
            if let _ = LCApplication.default.currentUser{
                showTextHUD("私信功能")
            }else{
                showLoginHUD()
            }
        }
    }
}
