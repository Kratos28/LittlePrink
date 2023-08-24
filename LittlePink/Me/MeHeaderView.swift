//
//  MeHeaderView.swift
//  LittlePink
//
//  Created by Kratos on 2023/7/22.
//

import UIKit
import LeanCloud
class MeHeaderView: UIView {

    @IBOutlet weak var editOrFollowBtn: UIButton!
    
    @IBOutlet weak var rootStackView: UIStackView!
    @IBOutlet weak var setttingOrChatBtn: UIButton!
    @IBOutlet weak var backOrSlideBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    
    
    @IBOutlet weak var likedAndFavedLabel: UILabel!
    
    
    override  func awakeFromNib() {
        super.awakeFromNib();
        editOrFollowBtn.makeCapsule();
        setttingOrChatBtn.makeCapsule();
    }
    
    var user:LCUser!{
        didSet{
            avatarImageView.kf.setImage(with: user.getImageURL(from: kAvatarCol, .avatar));
            nickNameLabel.text = user.getExactStringVal(kNickNameCol);
            let gender = user.getExactBoolValDefaultF(kGenderCol);
            genderLabel.text = gender ? "man" : "woman";
            genderLabel.textColor =  gender ? blueColor: mainColor;
            idLabel.text = "\(user.getExactIntVal(kIDCol))";
            let intro = user.getExactStringVal(kIntroCol);
            introLabel.text = user.getExactStringVal(kIntroCol).isEmpty ? kIntroPH:intro;
            guard let userObjectid =  user.objectId?.stringValue else {return}
            let query = LCQuery(className: kUserInfoTable);
            query.getFirst{ res in
                if  case let . success(object : userInfo) = res {
                  let likeCount =   userInfo.getExactIntVal(kLikeCountCol);
                  let favCount =   userInfo.getExactIntVal(kFavCountCol);
    
                    DispatchQueue.main.async {
                        self.likedAndFavedLabel.text = "\(likeCount + favCount)";
                    }
                }
            }
            
        }
    }
    
}
