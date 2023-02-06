//
//  NoteDetailVC-LoadData.swift
//  LittlePink
//
//  Created by Kratos on 2023/1/25.
//

import LeanCloud
extension NoteDetailVC
{
    func getComments(){
        showLoadHUD();
        let query = LCQuery(className: kCommentTable);
//        try? query.whereKey(kNoteCol, .equalTo(note));
        try?  query.where("\(kUserCol).\(kNickNameCol)", .selected);
       try? query.where(kUserCol,.included);
        try? query.where(kCreatedAtCol, .descending);
         query.limit =  kCommentOffSet;
        query.find { res in
            self.hideLoadHUD();
            if case let .success(objects: comments) = res
            {
                self.comments = comments;
                
                DispatchQueue.main.async {
                    self.tableView.reloadData();
                }
                
            }
        }
    }
    
    func getReplies(){
        let query = LCQuery(className: kReplyTable);
        let group = DispatchGroup();
        var replicsDic :[Int:[LCObject]] = [:];
        for (index, comment) in comments.enumerated()
        {
            group.enter();
           try? query.where(kCommentCol, .equalTo(comment));
           try? query.where(kUserCol, .included);
           try? query.where(kCreatedAtCol, .ascending);
            query.find { res in
                if case let   .success(objects: replies)   = res{
                    replicsDic[index] = replies;
                }else
                {
                    replicsDic[index] = [];
                }
                group.leave();
            }
        }
        group.notify(queue: .main) {
            self.replies =     replicsDic.sorted {$0.key < $1.key}.map {ExpandableRepiles(replies: $0.value)};
            DispatchQueue.main.async {
                self.tableView.reloadData();
            }
        }
    }
}
