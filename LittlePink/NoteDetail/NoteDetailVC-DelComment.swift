//
//  NoteDetailVC-DelComment.swift
//  LittlePink
//
//  Created by 刘军 on 2021/3/15.
//

import LeanCloud

extension NoteDetailVC{
    func delComment(_ comment: LCObject, _ section: Int){
        showDelAlert(for: "评论") { _ in
            //云端数据
            comment.delete { _ in }
            self.updateCommentCount(by: -1)//包含页面上的评论数变化的UI
            
            //内存数据
            self.comments.remove(at: section)
            
            //UI
            self.tableView.reloadData()//和删除草稿笔记一样,这里用reloadData会比较方便
        }
    }
}
