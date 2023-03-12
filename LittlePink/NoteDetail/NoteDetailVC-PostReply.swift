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
            let comment = comments[commentSection];
            let reply =  LCObject(className: kReplyTable);
            try reply.set(kTextCol,value: textView.unwrappedText);
            try reply.set(kUserCol, value: user);
            try reply.set(kCommentCol, value: comment);
            if let replyToUser = replyToUser{
              try? reply.set(kReplyToUserCol, value: replyToUser)
            }
            reply.save { res in
                
                if case .success = res{
                    if let hasReply =  comment.get(kHasReplyCol)?.boolValue,hasReply != true{
                        try? comment.set(kHasReplyCol, value: true);
                        comment.save{_ in }
                    }
                }
                
            }
            self.updateCommentCount(by: 1);
            replies[commentSection].replies.append(reply);
            tableView.performBatchUpdates {
                tableView.insertRows(at: [IndexPath(row: replies[commentSection].replies.count - 1, section: commentSection)], with: .automatic);
            }

        } catch  {
            print("给Reply表的字段复制失败");
        }
    }
}
