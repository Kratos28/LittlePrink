//
//  EditProfileTableVC-UI.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/12.
//

import Kingfisher

extension EditProfileTableVC{
    func setUI(){
        avatarImageView.kf.setImage(with: user.getImageURL(from: kAvatarCol, .avatar))
        
        nickName = user.getExactStringVal(kNickNameCol)
        
        gender = user.getExactBoolValDefaultF(kGenderCol)
        
        birth = user.get(kBirthCol)?.dateValue
        
        intro = user.getExactStringVal(kIntroCol)
    }
}
