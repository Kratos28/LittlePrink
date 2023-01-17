//
//  NoteDetailVC-TVDelegate.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/1/6.
//

import Foundation
import LeanCloud
extension NoteDetailVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let commentView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kCommentViewID) as! CommentView;
        let comment = comments[section];
        commentView.comment = comment;
        if let commentAuthor =  comment.get(kUserCol) as? LCUser, let noteAuthor = author,commentAuthor == noteAuthor{
            commentView.authorLabel.isHidden = false;
        }
        
        return commentView;
    }
}
