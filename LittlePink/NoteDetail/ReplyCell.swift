//
//  ReplyCell.swift
//  LittlePink
//
//  Created by Kratos on 2023/2/24.
//

import UIKit
import LeanCloud
class ReplyCell: UITableViewCell {

    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var replyTextLabel: UILabel!
    @IBOutlet weak var showAllReplyBtn: UIButton!
    var reply : LCObject? {
        didSet{
            guard let reply = reply else{return}
            if let user = reply.get(kUserCol) as? LCUser{
                avatarImageView.kf.setImage(with: user.getImageURL(from: kAvatarCol, .avatar));
                nickNameLabel.text = user.getExactStringVal(kNickNameCol);
            }
            let createdAt = reply.createdAt?.value;
            let dateText = createdAt == nil ? "刚刚" : createdAt!.formattedDate;
            let replyText = reply.getExactStringVal(kTextCol).spliceAttrStr(dateText);
            
            if let replyToUser = reply.get(kReplyToUserCol) as? LCUser{
                
               let replytoText =  "回复".toAttrStr();
                let nickName = replyToUser.getExactStringVal(kNickNameCol).toAttrStr(14,.secondaryLabel)
                let colon =  ": ".toAttrStr();
                replytoText.append(nickName);
                replytoText.append(colon);
                replyText.insert(replytoText, at: 0);
            }
            replyTextLabel.attributedText = replyText;
        }
    }
}
