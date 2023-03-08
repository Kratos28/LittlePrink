//
//  NoteDetailVC-Helper.swift
//  LittlePink
//
//  Created by Kratos on 2022/12/31.
//

import LeanCloud
extension NoteDetailVC
{
    func showDelAlert(for name:String,confirmHandler:((UIAlertAction)->())?){
        let alert = UIAlertController(title: "提示", message: "确认删除此\(name)", preferredStyle: .alert);
        let  action1 = UIAlertAction(title: "取消", style: .cancel);
        let action2 = UIAlertAction(title: "确认", style:.default,handler: confirmHandler)
        alert.addAction(action1);
        alert.addAction(action2);
        present(alert, animated: true);
    }
    func comment(){
        if let _ = LCApplication.default.currentUser
        {
            isReply = false;
            textView.placeholder = kNoteCommetPH;
            self.showTextView();
        }else{
            showTextHUD("请登录");
        }
    }
    
    func showTextView(_ isReply:Bool = false ,_ textViewPH:String = kNoteCommetPH)
    {
        self.isReply = isReply;
        textView.placeholder = textViewPH;
        textView.becomeFirstResponder()
        textViewBarView.isHidden = false;
    }
    
    func hideAndRestTextView(){
        textView.resignFirstResponder();
        textView.text = "";
    }
    
    func updateCommentCount(by offset:Int){
        try? self.note.increase(kCommentCountCol,by:  offset);
        note.save{_ in}
        self.commentCount += offset;
    }
    
    
}
