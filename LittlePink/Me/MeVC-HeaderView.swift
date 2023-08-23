//
//  MeVC-HeaderView.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/23.
//

import LeanCloud

extension MeVC{
    func setHeaderView()->UIView
    {
        let headerView = Bundle.loadView(fromNib: "MeHeadView", with:MeHeaderView.self);

        headerView.translatesAutoresizingMaskIntoConstraints = false;
        headerView.heightAnchor.constraint(equalToConstant: headerView.rootStackView.frame.height  + 26).isActive =
        true;
        headerView.user = user;

        if isFromNote
        {
            headerView.backOrSlideBtn.setImage(largeIcon("chevron.left"), for: .normal);
            
        }
        headerView.backOrSlideBtn.addTarget(self, action: #selector(backOrDrawer), for: .touchUpInside);
        if isMySelf
        {
            
            
            headerView.introLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(editIntro)))
        }else
        {
           if user.getExactStringVal(kIntroCol).isEmpty
            {
                headerView.introLabel.isHidden = true;
            }
            if let _  = LCApplication.default.currentUser{
                headerView.editOrFollowBtn.setTitle("关注", for: .normal);
                headerView.editOrFollowBtn.backgroundColor = mainColor;
            }else
            {
                headerView.backOrSlideBtn.setTitle("关注", for: .normal);
                headerView.backOrSlideBtn.backgroundColor = mainColor;
            }
            headerView.setttingOrChatBtn.setImage(fontIcon("ellipsis.bundle", fontSize: 13), for: .normal);
                    
        }
        headerView.editOrFollowBtn.addTarget(self, action: #selector(editOrFllow), for: .touchUpInside);
        headerView.setttingOrChatBtn.addTarget(self, action: #selector(settingOrChat), for: .touchUpInside);
        return headerView;
    }
    
}
