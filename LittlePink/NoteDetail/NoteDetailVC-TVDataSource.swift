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
        let replyCount =  replies[section].replies.count;
        return replyCount > 1 ? 1 : replyCount;
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kReplyCellID, for: indexPath) as! ReplyCell;
        
        let reply = replies[indexPath.section].replies[indexPath.row];
        cell.reply = reply;
     if  let replyAuthor = reply.get(kUserCol) as? LCUser,let noteAuthor = author,replyAuthor == noteAuthor{
            cell.authorLabel.isHidden = false;
        }
        let replyCount = replies[indexPath.section].replies.count
        if replyCount > 1
        {
            cell.showAllReplyBtn.isHidden = false;
            cell.showAllReplyBtn.setTitle("展示\(replyCount - 1 )", for: .normal);
            cell.showAllReplyBtn.addTarget(self, action: #selector(showAllReply), for: .touchUpInside);
        }else
        {
            cell.showAllReplyBtn.isHidden = true;
        }
        
        
        return cell;
    }
    
    
}

extension NoteDetailVC
{
    @objc private func showAllReply(sender:UIButton)
    {
        tableView.reloadData();
     
    }
}
