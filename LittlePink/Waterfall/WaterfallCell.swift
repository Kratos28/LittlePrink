//
//  WaterfallCell.swift
//  LittlePink
//
//  Created by 刘军 on 2020/11/8.
//

import UIKit
import LeanCloud
import Kingfisher

class WaterfallCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var likebtn: UIButton!
    
    var note: LCObject?{
        didSet{
            guard let note = note, let author = note.get(kAuthorCol) as? LCUser else { return }
            
            //加载远程图片(笔记封面)
            let coverPhotoURL = note.getImageURL(from: kCoverPhotoCol, .coverPhoto)
            imageView.kf.setImage(with: coverPhotoURL, options: [.transition(.fade(0.2))])
            
            //加载远程图片(作者头像)
            let avatarURL = author.getImageURL(from: kAvatarCol, .avater)
            avatarImageView.kf.setImage(with: avatarURL)
            
            //笔记标题
            titleLabel.text = note.getExactStringVal(kTitleCol)
            
            //笔记被赞数
            likebtn.setTitle("\(note.getExactIntVal(kLikeCountCol))", for: .normal)
            
            //待做:点赞功能+判断是否已点赞
        }
    }
    
}
