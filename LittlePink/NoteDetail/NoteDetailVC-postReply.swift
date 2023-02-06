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
            //1.reply表
            let reply =  LCObject(className: kReplyTable);
            try reply.set(kTextCol,value: textView.unwrappedText);
            try reply.set(kUserCol, value: user);
            try reply.set(kCommentCol, value: comments[commentSection]);
            reply.save { _ in}
            try? note.increase(kCommentCountCol);
            note.save { _ in}
            
            replies[commentSection].append(reply);
            tableView.performBatchUpdates {
                tableView.insertRows(at: [IndexPath(row: replies[commentSection].count - 1, section: commentSection)], with: .automatic)
            }
            commentCount += 1;
        } catch  {
             
        }
    }
}
