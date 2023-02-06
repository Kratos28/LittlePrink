//
//  ReplyCell.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/2/6.
//

import UIKit
import LeanCloud
class ReplyCell: UITableViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var replyTextLabel: UILabel!
    @IBOutlet weak var showAllReplyBtn: UIButton!
    var reply:LCObject?{
        didSet
        {
            guard let reply = reply else {return}
            if let user = reply.get(kUserCol)as? LCUser{
                avatarImageView.kf.setImage(with: user.getImageURL(from: kVideoCol, .avatar));
                nickNameLabel.text = user.getExactStringVal(kNickNameCol);
            }
            
            let replyText = reply .getExactStringVal(kTextCol);
            let createAt = reply.createdAt?.value;
            let dateText = createAt == nil ? "刚刚" : createAt!.formattedDate;
            replyTextLabel.attributedText =  replyText.spliceAttrStr(dateText);
        }
    }
}
