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
            if isLike
            {
                 let  userLike =  LCObject(className: kUserLikeTable);
                 try? userLike.set(kUserCol, value: user);
                 try? userLike.set(kNoteCol, value: note);
                 userLike.save { _ in}
                try? note.increase(kLikeCountCol);
                try? author?.increase(kLikeCountCol);
            }else
            {
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
                try? author?.set(kLikeCountCol, value: likeCount);
                author?.save { _ in}

            }
            
        }else
        {
            showTextHUD("请先登录");
        }
    }
    func  fav()
    {
        if let user = LCApplication.default.currentUser{
        }else
        {
            showTextHUD("请先登录");
        }
    }
}
