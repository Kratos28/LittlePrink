//
//  NoteDetailVC-DelNote.swift
//  LittlePink
//
//  Created by 刘军 on 2021/3/3.
//

import LeanCloud

extension NoteDetailVC{
    func delNote(){
        showDelAlert(for: "笔记") { _ in
            //数据
            self.delLCNote()
            
            //UI
            self.dismiss(animated: true) {
                self.delNoteFinished?()
            }
        }
    }
    
    private func delLCNote(){
        
        note.delete { res in
            if case .success = res{
                //用户表的noteCount减1
                try? self.author?.set(kNoteCountCol, value: self.author!.getExactIntVal(kNoteCountCol) - 1)
                self.author?.save{ _ in }
                
                DispatchQueue.main.async {
                    self.showTextHUD("笔记已删除")                    
                }
            }
        }
        
    }
}
