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
        followBtn.makeCapsule(mainColor)
        
        if isReadMyNote{
            followBtn.isHidden = true
            shareOrMoreBtn.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        }
        
        showNote()
        showLike()
    }
    
    func showNote(_ isUpdatingNote: Bool = false){
        //上方bar的author
        if !isUpdatingNote{
            let authorAvatarURL = author?.getImageURL(from: kAvatarCol, .avatar)
            authorAvatarBtn.kf.setImage(with: authorAvatarURL, for: .normal)
            authorNickNameBtn.setTitle(author?.getExactStringVal(kNickNameCol), for: .normal)
        }
        
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
            dateLabel.text = "\(note.getExactBoolValDefaultF(kHasEditCol) ? "编辑于 " : "")\(updatedAt.formattedDate)"
        }
        
        //当前用户头像
        if let user = LCApplication.default.currentUser{
            let avatarURL = user.getImageURL(from: kAvatarCol, .avatar)
            avatarImageView.kf.setImage(with: avatarURL)
        }
        
        //点赞数
        likeCount = note.getExactIntVal(kLikeCountCol)
        currentLikeCount = likeCount
        
        //收藏数
        favCount = note.getExactIntVal(kFavCountCol)
        currentFavCount = favCount
        
        //评论数
        commentCount = note.getExactIntVal(kCommentCountCol)
    }
    
    private func showLike(){
        //如果用户是从推送横幅进来的话,需重新查询云端数据,用于点赞的去重
        if isFromPush{
            if let user = LCApplication.default.currentUser{
                let query = LCQuery(className: kUserLikeTable)
                query.whereKey(kUserCol, .equalTo(user))
                query.whereKey(kNoteCol, .equalTo(note))
                query.getFirst { res in
                    if case .success = res{
                        DispatchQueue.main.async {
                            self.likeBtn.setSelected(selected: true, animated: false)
                        }
                    }
                }
            }
        }else{
            //likeBtn.isSelected = isLikeFromWaterfallCell //因点赞包点赞后有默认动画,故为了体验不使用此方法
            likeBtn.setSelected(selected: isLikeFromWaterfallCell, animated: false)//点赞包的方法,可实现无动画
        }
    }
}
