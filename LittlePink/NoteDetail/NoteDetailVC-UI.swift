//
//  NoteDetailVC-UI.swift
//  LittlePink
//
//  Created by 刘军 on 2021/2/17.
//

import Kingfisher
import LeanCloud
import ImageSlideshow

extension NoteDetailVC{
    func setUI(){
        followBtn.layer.borderWidth = 1
        followBtn.layer.borderColor = mainColor.cgColor
        
        showNote()
    }
    
    private func showNote(){
        //上方bar的author
        let authorAvatarURL = author?.getImageURL(from: kAvatarCol, .avater)
        authorAvatarBtn.kf.setImage(with: authorAvatarURL, for: .normal)
        authorNickNameBtn.setTitle(author?.getExactStringVal(kNickNameCol), for: .normal)
        
        //note图片
        //1.图片高度
        let coverPhotoHeight = CGFloat(note.getExactDoubelVal(kCoverPhotoRatioCol)) * screenRect.width
        imageSlideShowHeight.constant = coverPhotoHeight
        //2.加载图片
        //第一次转场动画过来后,因加载网络图片需要时间,故会有空白一闪而过.后面再操作因为Kingfisher已经缓存了图片,故没有
        //可把第一张图替换为已经加载并缓存好的封面图,此时需让:存封面图和普通图片时,压缩率调成一样,这样可保持所有图片清晰度一样
        let coverPhoto = KingfisherSource(url: note.getImageURL(from: kCoverPhotoCol, .coverPhoto))
        if let photoPaths = note.get(kPhotosCol)?.arrayValue as? [String]{
            var photoArr = photoPaths.compactMap{ KingfisherSource(urlString: $0) }
            photoArr[0] = coverPhoto
            imageSlideshow.setImageInputs(photoArr)
        }else{
            imageSlideshow.setImageInputs([coverPhoto])
        }
        
        //note标题
        let noteTitle = note.getExactStringVal(kTitleCol)
        if noteTitle.isEmpty{
            titleLabel.isHidden = true
        }else{
            titleLabel.text = noteTitle
        }
        
        //note正文
        let noteText = note.getExactStringVal(kTextCol)
        if noteText.isEmpty{
            textLabel.isHidden = true
        }else{
            textLabel.text = noteText
        }
        
        //note话题
        let noteChannel = note.getExactStringVal(kChannelCol)
        let noteSubChannel = note.getExactStringVal(kSubChannelCol)
        channelBtn.setTitle(noteSubChannel.isEmpty ? noteChannel : noteSubChannel, for: .normal)
        
        //note发表或编辑时间
        if let updatedAt = note.updatedAt?.value{
            dateLabel.text = "\(note.getExactBoolVal(kHasEditCol) ? "编辑于 " : "")\(updatedAt.formattedDate)"
        }
        
        //当前用户头像
        if let user = LCApplication.default.currentUser{
            let avatarURL = user.getImageURL(from: kAvatarCol, .avater)
            avatarImageView.kf.setImage(with: avatarURL)
        }
        
        //底部bar的点赞数,收藏数,评论数
        likeCount = note.getExactIntVal(kLikeCountCol)
        favCount = note.getExactIntVal(kFavCountCol)
        commentCount = note.getExactIntVal(kCommentCountCol)
    }
}
