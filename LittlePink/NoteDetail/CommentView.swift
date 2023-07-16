//
//  CommentView.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/1/6.
//

import UIKit
import LeanCloud
import Kingfisher
class CommentView: UITableViewHeaderFooterView {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var commentTextLabel: UILabel!
    var comment: LCObject?{
        didSet{
            guard let comment = comment else {return};
            if let user = comment.get(kUserCol) as? LCUser{
                avatarImageView.kf.setImage(with: user.getImageURL(from: kAvatarCol, .avatar));
                nickNameLabel.text = user.getExactStringVal(kNickNameCol);
            }
            
            let commentText = comment.getExactStringVal(kTextCol);
            let createAt = comment.createdAt?.value;
            let dateText = createAt == nil ? "刚刚" : createAt!.formattedDate;
            commentTextLabel.attributedText =    commentText.spliceAttrStr(dateText);
            
        }
    }
    

}
