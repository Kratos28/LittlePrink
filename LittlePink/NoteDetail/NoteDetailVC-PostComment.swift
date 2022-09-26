//
//  NoteDetailVC-postComment.swift
//  LittlePink
//
//  Created by 刘军 on 2021/3/16.
//

import LeanCloud

extension NoteDetailVC{
    func postComment(){
        let user = LCApplication.default.currentUser!
        do {
            //云端数据
            //1.comment表
            let commentText = textView.unwrappedText
            
            let comment = LCObject(className: kCommentTable)
            try comment.set(kTextCol, value: commentText)
            try comment.set(kUserCol, value: user)
            try comment.set(kNoteCol, value: note)
            comment.save { [self] res in
                if case .success = res{
                    sendPush(commentText)
                }
            }
            //2.note表
            self.updateCommentCount(by: 1)//包含页面上的评论数变化的UI
            
            //内存数据
            comments.insert(comment, at: 0)
            replies.insert(ExpandableReplies(replies: []), at: 0)
            
            //UI
            tableView.performBatchUpdates {
                tableView.insertSections(IndexSet(integer: 0), with: .automatic)
            }
        } catch {
            print("给Comment表的字段赋值失败: \(error)")
        }
    }
    
    //当有用户发布评论时给笔记作者发送推送
    private func sendPush(_ commentText: String){
        guard let author = author, let noteID = note.objectId?.stringValue else { return }
        
        let query = LCQuery(className: "_Installation")
        query.whereKey(kUserCol, .equalTo(author))
        
        let alertDic = [
            "title": "\(author.getExactStringVal(kNickNameCol))对您的笔记发表了评论:",
            "body": commentText
        ]
        let payload: [String: Any] = [
            "alert": alertDic,
            "badge": "Increment",
            "noteID": noteID
        ]

        LCPush.send(data: payload, query: query) { _ in }
    }
}
