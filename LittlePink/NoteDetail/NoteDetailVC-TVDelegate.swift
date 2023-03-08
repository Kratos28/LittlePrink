//
//  NoteDetailVC-TVDelegate.swift
//  LittlePink
//
//  Created by JZ_MacMini on 2023/1/6.
//

import Foundation
import LeanCloud
import UIKit
extension NoteDetailVC:UITableViewDelegate{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let commentView = tableView.dequeueReusableHeaderFooterView(withIdentifier: kCommentViewID) as! CommentView;
        let comment = comments[section];
        commentView.comment = comment;
        if let commentAuthor =  comment.get(kUserCol) as? LCUser, let noteAuthor = author,commentAuthor == noteAuthor{
            commentView.authorLabel.isHidden = false;
        }
        let commentTap = UITapGestureRecognizer(target: self, action: #selector(commentTaped));
        commentView.tag = section;
        commentView.addGestureRecognizer(commentTap);
        return commentView;
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let separatorLine = tableView.dequeueReusableCell(withIdentifier: kCommentSectionFooterViewID);
        return separatorLine;
    }
    
    //用户按下评论的回复Cellh后
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let user = LCApplication.default.currentUser{
           let reply =  replies[indexPath.section].replies[indexPath.row];
            guard let replyAuthor =  reply.get(kUserCol) as? LCUser else {return}
            if user ==  replyAuthor
            {
                let replyText = reply.getExactStringVal(kTextCol);
                let alert = UIAlertController(title: nil, message: "你的回复\(replyText)", preferredStyle: .actionSheet);
                let subReplyAction = UIAlertAction(title: "回复", style: .default){ _ in
                    
                }
                let copyAction  = UIAlertAction(title: "复制", style: .destructive){ _ in
                    UIPasteboard.general.string = replyText;
                }
                let deleteAction  = UIAlertAction(title: "删除", style: .destructive){ _ in
                    self.delReply(reply, indexPath);
                }
                
                let cancelAction  = UIAlertAction(title: "取消", style: .cancel){ _ in
                    
                }
                alert.addAction(subReplyAction);
                alert.addAction(copyAction);
                alert.addAction(deleteAction);
                alert.addAction(cancelAction);


                present(alert, animated: true)
                
            }else
            {
                tableView.deselectRow(at: indexPath, animated: true);
            }
        }else
        {
            showTextHUD("请先登录");
        }
    }

}
extension NoteDetailVC{
    @objc func commentTaped(_ tap : UITapGestureRecognizer)
    {
        if let user = LCApplication.default.currentUser
        {
            
            guard let section = tap.view?.tag else {return};
            let comment = comments[section];
            guard  let commentAuthor = comment.get(kUserCol) as? LCUser else {return}
            let commentAuthorNickName = commentAuthor.getExactStringVal(kNickNameCol);

            if commentAuthor == user {
                let commentText = comment.getExactStringVal(kTextCol);
                let alert = UIAlertController(title: nil, message: "你的评论\(commentText)", preferredStyle: .actionSheet);
                let replyAction = UIAlertAction(title: "回复", style: .default){ _ in
                    //回复
                    self.prepareForReply(commentAuthorNickName,section);

                }
                replyAction.setTitleColor(mainColor);
                let copyAction  = UIAlertAction(title: "复制", style: .destructive){ _ in
                    //回复
                    UIPasteboard.general.string = commentText;
                }
                let deleteAction  = UIAlertAction(title: "删除", style: .destructive){ _ in
                    self.delComment(comment, section);
           
                }
                
                let cancelAction  = UIAlertAction(title: "取消", style: .cancel){ _ in
                    
                }
                alert.addAction(replyAction);
                alert.addAction(copyAction);
                alert.addAction(deleteAction);
                alert.addAction(cancelAction);


                present(alert, animated: true)
            }else {
                //回复
                prepareForReply(commentAuthorNickName,section);
            }
            
        }else
        {
            showTextHUD("请先登录");
        }
    }
}

extension NoteDetailVC
{
    private func prepareForReply(_ commentAuthorNickName:String , _ section:Int )
    {
    
        showTextView(true,"回复 \(commentAuthorNickName)");
        commentSection = section;
    }
}
