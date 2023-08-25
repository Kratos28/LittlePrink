//
//  MeVC-Delegate.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/25.
//

import LeanCloud
extension MeVC :EditProfileTableVCDelegate
{
    func updateUser(_ avatar: UIImage?, _ nickName: String, _ gender: Bool, _ birth: Date?, _ intro: String) {
        if let avatar = avatar,let data = avatar.jpeg(.high)
        {
            let avatarFile = LCFile(payload: .data(data: data));
            avatarFile.save(to: user, as: kAvatarCol);
            meHeaderView.avatarImageView.image = avatar
        }
        try? user.set(kNickNameCol, value: nickName);
        meHeaderView.nickNameLabel.text = nickName;
        try? user.set(kGenderCol, value: gender);
        meHeaderView.genderLabel.text = gender ? "男" : "女";
        meHeaderView.genderLabel.textColor = gender ? blueColor : mainColor;
        try? user.set(kBrithCol,value: birth);
        try? user.set(kIntroCol,value: intro);
        meHeaderView.introLabel.text = intro.isEmpty ? kIntroPH  : intro;
        user.save { _ in}

    }
}
