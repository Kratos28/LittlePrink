//
//  WaterfallCell-Like.swift
//  LittlePink
//
//  Created by Kratos on 2022/12/29.
//
import LeanCloud
extension WaterfallCell
{
    
    @objc func likeBtnTappedWhenLogin()
    {
        if likeCount != currentLikeCount{
            guard let note = note ,let authorObjectId = (note.get(kAvatarCol) as? LCUser)?.objectId?.stringValue else {return};
            let user = LCApplication.default.currentUser!;
            let offset = isLike ? 1 : -1;
            currentLikeCount += offset;
            if isLike
            {
                 let  userLike =  LCObject(className: kUserLikeTable);
                 try? userLike.set(kUserCol, value: user);
                 try? userLike.set(kNoteCol, value: note);
                 userLike.save { _ in}
                //点赞数
                try? note.increase(kLikeCountCol);
                
                //不能修改别人的user表字段，故里面不能放xxxCount这种，因为费这个用户本人是存不进去的
                LCObject.userInfo(where: authorObjectId, Increase: kLikeCountCol);
                
                
              
            }else
            {
                //userLike中间表
                let query = LCQuery(className: kUserLikeTable);
                try? query.where(kUserCol, .equalTo(user));
                try? query.where(kNoteCol, .equalTo(note));
                query.getFirst { res in
                    if case let .success(object:userLike) = res{
                        userLike.delete { _  in}
                    }
                }
                try? note.set(kLikeCountCol, value: likeCount);
                note.save { _ in}
                LCObject.userInfo(where: authorObjectId, decrease: kLikeCountCol, to: likeCount);
                
            }

        }
        
    }

}
