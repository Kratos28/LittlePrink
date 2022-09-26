//
//  MeVC-UI.swift
//  LittlePink
//
//  Created by 刘军 on 2021/3/29.
//

import SegementSlide

extension MeVC{
    func setUI(){
        //改变基类属性-适配深色模式
        scrollView.backgroundColor = .systemBackground
        contentView.backgroundColor = .systemBackground
        switcherView.backgroundColor = .systemBackground
        
        //let statusBarH = UIApplication.shared.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height
        let statusBarOverlayView = UIView(frame: CGRect(x: 0, y: 0, width: screenRect.width, height: kStatusBarH))
        statusBarOverlayView.backgroundColor = .systemBackground
        view.addSubview(statusBarOverlayView)
        
        defaultSelectedIndex = 0
        reloadData()
    }
}
