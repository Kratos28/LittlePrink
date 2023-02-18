//
//  NoteDetailVC-postReply.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/2/2.
//

import LeanCloud


extension NoteDetailVC
{
    func postReply()
    {
        let user = LCApplication.default.currentUser;
        do {
            let reply =  LCObject(className: kReplyTable);
            try reply.set(kTextCol,value: textView.unwrappedText);
            try reply.set(kUserCol, value: user);
            try reply.set(kCommentCol, value: comments[commentSection]);
            reply.save { _ in
                
            }
        } catch  {
            print("给Reply表的字段复制失败");
        }
    }
}
