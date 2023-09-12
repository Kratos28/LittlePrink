//
//  NoteDetailVC-PostComment.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/2/2.
//

import LeanCloud

extension NoteDetailVC
{
    func postComment()
    {
        let user = LCApplication.default.currentUser!
        do {
            
            let commentText = textView.unwrappedText;
            let comment = LCObject(className: kCommentTable)
            try? comment.set(kTextCol, value: commentText);
            try? comment.set(kUserCol, value: user);
            try? comment.set(kNoteCol, value: note);
            comment.save { [self] res in
                if case .success = res{
                    sendPush(commentText);
                    
                }
            }
            self.updateCommentCount(by: 1);

            comments.insert(comment, at: 0);
            replies.insert(ExpandableReplies(replies: []), at: 0);
            tableView.performBatchUpdates {
                tableView.insertSections(IndexSet(integer: 0), with: .automatic);
            };
        } catch  {
            print("哈哈哈");
        }
    }
    
    
    private func sendPush(_ conmentText : String){
        guard let author = author ,let noteID = note.objectId?.stringValue else {return};
        let query = LCQuery(className: "_Installation");
       try? query.where(kUserCol, .equalTo(author));
        
        let alertDic = ["title": "\(author.getExactStringVal(kNickNameCol))对您的笔记发表了评论:",
                        "body":conmentText,
        ]
        let payload: [String:Any] = [
            "alert" :alertDic,
            "badge":"Increment",
            "noteID": noteID
        ]
        LCPush.send(data: payload,query: query){(result) in
         
            
        }
    }
    
}

