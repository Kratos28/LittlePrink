//
//  EditProfileTableVC-UI.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import Kingfisher

extension EditProfileTableVC{
    func setUI(){
        avatarImageView.kf.setImage(with: user.getImageURL(from: kAvatarCol, .avatar));
        nickName = user.getExactStringVal(kNickNameCol);
        gender =  user.getExactBoolValDefaultF(kGenderCol);
        birth = user.get(kBrithCol)?.dateValue
        intro = user.getExactStringVal(kIntroCol);
        
    }
}
