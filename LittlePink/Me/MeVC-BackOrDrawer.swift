//
//  MeVC-BackOrDrawer.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/1.
//

import Foundation

extension MeVC{
    @objc func backOrDrawer(_ sender: UIButton){
        if isFromNote{
            dismiss(animated: true)
        }else{
            //抽屉菜单
        }
    }
}
