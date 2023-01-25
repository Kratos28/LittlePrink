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
}
