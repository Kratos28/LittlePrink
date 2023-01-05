//
//  NoteDetailVC-DelNote.swift
//  LittlePink
//
//  Created by Kratos on 2022/12/31.
//

import LeanCloud

extension NoteDetailVC
{
    func delNote()
    {
        showDelAlert(for: "笔记") { _ in
            self.delLCNote();
            self.dismiss(animated: true){
                self.delNoteFinished?();
            }
        }
    }
    func delLCNote()
    {
        note.delete { res in
            if case  .success = res{
                self.showTextHUD("笔记已经删除");
            }
        }
    }
}
