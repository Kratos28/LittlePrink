//
//  MeVC-SettingOrChat.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/23.
//

import LeanCloud
extension MeVC{
    @objc func settingOrChat()
    {
        if isMySelf
        {
            let settingTableVC = storyboard!.instantiateViewController(withIdentifier: kSettingTableVCID) as! SettingTableVC;
            settingTableVC.user = user;
            present(settingTableVC, animated: true);
        }else{
            if let _ = LCApplication.default.currentUser{
                print("私信功能");
            }else
            {
                showLoginHUD();
            }
        }
    }
    
}
