//
//  NoteDetailVC-TVDataSource.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/1/6.
//

import Foundation
import LeanCloud
extension NoteDetailVC:UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        comments.count;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        replies[section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReplyCellID, for: indexPath) as! ReplyCell
        let reply =  replies[indexPath.section][indexPath.row];
        cell.reply = reply;
       if let replyAuthor =  reply.get(kUserCol) as? LCUser,let noteAuthor = author,replyAuthor ==  noteAuthor
        {
           cell.authorLabel.isHidden  = false;
        }
        return cell;
    }
    
    
}
