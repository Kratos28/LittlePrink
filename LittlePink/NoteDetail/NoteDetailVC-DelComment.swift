//
//  NoteDetailVC-DelComment.swift
//  LittlePink
//
//  Created by Kratos on 2023/1/25.
//

import LeanCloud
extension NoteDetailVC
{
    func delComment(_ comment: LCObject, _ section: Int){
        showDelAlert(for: "评论") { _ in
            comment.delete { _ in }
            try? self.note.increase(kCommentCountCol, by: -1)
            self.note.save { _ in}
            self.comments.remove(at: section);
            self.tableView.reloadData();
            self.commentCount -= 1;
        }
    }
}
