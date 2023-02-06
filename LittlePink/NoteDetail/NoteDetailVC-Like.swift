//
//  NoteDetail-LikeFav.swift
//  LittlePink
//
//  Created by K on 2022/10/11.
//

import Foundation
import LeanCloud
extension NoteDetailVC
{
    
    
    
    func like()
    {
        if let user = LCApplication.default.currentUser{
            isLike ? (likeCount += 1) : (likeCount -= 1);
            
            //防止暴力点击
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(likeBtnTappedWhenLogin), object: nil);
            perform(#selector(likeBtnTappedWhenLogin), with: nil, afterDelay: 1);

        
            
        }else
        {
            showTextHUD("请先登录");
        }
    }
    @objc func likeBtnTappedWhenLogin()
    {
        if likeCount != currentLikeCount
        {
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
                note.save { _ in}

                //不能修改别人的user表字段，故里面不能放xxxCount这种，因为费这个用户本人是存不进去的
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
//                author?.save { _ in}

            }
        }
    }
    
}
