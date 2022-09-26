//
//  MeVC-Config.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/2.
//

import LeanCloud
import Hero

extension MeVC{
    func config(){
        //iOS14之前去掉返回按钮文本的话需:
        //1.sb上:上一个vc(MeVC)的navigationitem中修改为空格字符串串
        //2.代码:上一个vc(此页)navigationItem.backButtonTitle = ""
        navigationItem.backButtonDisplayMode = .minimal
        
        if let user = LCApplication.default.currentUser, user == self.user{
            isMySelf = true
        }
        
    }
}
