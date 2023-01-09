//
//  NoteDetailVC-TVDelegate.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/1/6.
//

import Foundation
extension NoteDetailVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let commentView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kCommentViewID) as! CommentView;
        return commentView;
    }
}
