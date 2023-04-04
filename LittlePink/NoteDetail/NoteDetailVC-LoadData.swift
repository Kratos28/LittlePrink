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
         query.whereKey("\(kUserCol).\(kNickNameCol)", .selected);
        query.whereKey(kUserCol,.included);
        query.whereKey(kReplyToUserCol,.included);
         query.whereKey(kCreatedAtCol, .descending);
         query.limit =  kCommentOffSet;
        query.find { res in
            self.hideLoadHUD();
            if case let .success(objects: comments) = res
            {
                self.comments = comments;
                self.getReplies();
//                DispatchQueue.main.async {
//                    self.tableView.reloadData();
//                }
                
            }
        }
    }
    
    func getReplies()
    {
        var repliesDic : [Int:[LCObject]] = [:];
        let group = DispatchGroup();
        for (index , comment) in comments.enumerated()
        {
           if  comment.getExactBoolValDefaultT(kHasReplyCol){
               group.enter();
               let query = LCQuery(className: kReplyTable);

               query.whereKey(kCommentCol,.equalTo(comment));
               query.whereKey(kUserCol, .included);
               query.whereKey(kCreatedAtCol, .ascending);
               query.find { res in
                   if case let .success(objects: replies) = res{
                       if replies.isEmpty
                       {
                           try? comment.set(kHasReplyCol, value: false)
                           comment.save{_ in }
                       }
                       repliesDic[index] = replies;
                   }else{
                       repliesDic[index] = [];
                   }
                   group.leave();
               }
           }else{
               repliesDic[index] = [];
           } 
        
         
        }
        group.notify(queue: .main) {
            self.replies =   repliesDic.sorted {$0.key < $1.key}.map{
                ExpandableReplies(replies: $0.value)
                
            };
            DispatchQueue.main.async {
                self.tableView.reloadData();
            }
        }
    }
    

}
    
