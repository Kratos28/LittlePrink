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
            let navi = storyboard!.instantiateViewController(withIdentifier: kEditProfileNaviID) as! UINavigationController;
            navi.modalPresentationStyle = .fullScreen;
            present(navi, animated: false);
        }else
        {
            if let _ = LCApplication.default.currentUser{
    
                showTextHUD("关注和取消关注功能");
            }else {
                showLoginHUD();
            }
        }
    }
}
