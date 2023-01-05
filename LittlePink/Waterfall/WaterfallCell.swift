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
    var likeCount = 0
    {
        didSet{
            likebtn.setTitle(likeCount.formattedStr, for: .normal);
        }
    }
    var currentLikeCount = 0;
    var isLike:Bool{likebtn.isSelected;}
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
    
            likeCount = note.getExactIntVal(kLikeCountCol);
            currentLikeCount = likeCount;
            //待做:点赞功能+判断是否已点赞
            
            if let user = LCApplication.default.currentUser
            {
                let query = LCQuery(className: kUserLikeTable);
                try? query.where(kUserCol,.equalTo(user));
                try? query.where(kNoteCol,.equalTo(note));
                query.getFirst { res in
                    if case  .success = res{
                        DispatchQueue.main.async {
                            self.likebtn.isSelected = true;

                        }
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib();
        let icon = UIImage(systemName: "heart.fill")?.withTintColor(mainColor,renderingMode: .alwaysOriginal);
        
        likebtn.setImage(icon, for: .selected);
    }
    
    @IBAction func like(_ sender: Any) {
        if let _ = LCApplication.default.currentUser
        {
            likebtn.isSelected.toggle();
            isLike ? (likeCount += 1) : (likeCount -= 1);
            
            //防止暴力点击
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(likeBtnTappedWhenLogin), object: nil);
            perform(#selector(likeBtnTappedWhenLogin), with: nil, afterDelay: 1);
            
        
        }
        else
        {
            showGlobalTextHUD("请先登录");
        }

    }
    
}

extension WaterfallCell
{

}
