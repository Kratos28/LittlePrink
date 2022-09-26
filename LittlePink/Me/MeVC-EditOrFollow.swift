//
//  MeVC-EditOrFollow.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/3.
//

import LeanCloud

extension MeVC{
    @objc func editOrFollow(){
        if isMySelf{//编辑资料
            let navi = storyboard!.instantiateViewController(identifier: kEditProfileNaviID) as! UINavigationController
            navi.modalPresentationStyle = .fullScreen
            //把系统自带的转场动画改成push和pop动画
            navi.heroModalAnimationType = .selectBy(presenting: .push(direction: .left), dismissing: .pull(direction: .right))
            let editProfileTableVC = navi.topViewController as! EditProfileTableVC
            editProfileTableVC.user = user
            editProfileTableVC.delegate = self
            present(navi, animated: true)
            
        }else{
            if let _ = LCApplication.default.currentUser{
                showTextHUD("关注和取消关注功能")
            }else{
                showLoginHUD()
            }
        }
    }
}
