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
            let comment = LCObject(className: kCommentTable)
            try? comment.set(kTextCol, value: textView.unwrappedText);
            try? comment.set(kUserCol, value: user);
            try? comment.set(kNoteCol, value: note);
            comment.save { _ in
               
            }
            try? note.increase(kCommentCountCol);
            note.save { _ in}

            comments.insert(comment, at: 0);
            tableView.performBatchUpdates {
                tableView.insertSections(IndexSet(integer: 0), with: .automatic);
            };
            commentCount += 1;
        } catch  {
            print("哈哈哈");
        }
    }
    
    
 
    
}

