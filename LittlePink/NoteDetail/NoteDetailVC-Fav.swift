//
//  NoteDetail-Fav.swift
//  LittlePink
//
//  Created by Kratos on 2022/12/29.
//

import LeanCloud
extension NoteDetailVC
{
    func  fav()
    {
        if let _ = LCApplication.default.currentUser{
            isFav ? (favCount += 1) : (favCount -= 1);
            //防止暴力点击
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(favBtnTappedWhenLogin), object: nil);
            perform(#selector(favBtnTappedWhenLogin), with: nil, afterDelay: 1);
        }else
        {
            
            showTextHUD("请先登录");
        }
    }
    
    @objc func favBtnTappedWhenLogin()
    {
        if favCount != currentFavCount
        {
            let  user = LCApplication.default.currentUser!;
            let authorObjectId = author?.objectId?.stringValue ?? ""
            let offset = isFav ? 1 : -1
            currentFavCount += offset;
            
            if isFav{
                let userFav = LCObject(className: kUserFavTable);
                try? userFav.set(kUserCol, value: user);
                try? userFav.set(kUserCol, value: note);
                userFav.save { _ in};
                try?note.increase(kFavCountCol)
                LCObject.userInfo(where: authorObjectId, Increase: kFavCountCol);
            }else
            {
                let query = LCQuery(className:kUserFavTable);
                query.whereKey(kUserCol, .equalTo(user));
                query.whereKey(kNoteCol, .equalTo(note));
                query.getFirst { res in
                    if case let .success(object: userFav) = res{
                        userFav.delete { _ in}
                    }
                }
                try? note.set(kFavCountCol, value: favCount)
                note.save { _ in}
                LCObject.userInfo(where: authorObjectId, decrease: kFavCountCol, to: favCount);

                
            }
        }
    }
}
