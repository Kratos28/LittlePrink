//
//  NoteEditVC-Helper.swift
//  LittlePrink
//
//  Created by K on 2022/8/16.
//

import Foundation

extension NoteEditVC{
    func validateNote()
    {
        
        guard !photos.isEmpty else{
            showLoadHUd("至少学要传一张图片");
            return;
        }
        
        guard TextViewIAView.textCountLabel.text!.count  < kMaxNoteTextCount else
        {
            showLoadHUd("正文最多输入");
            return;
        }
    }
    
    func handeleTFEditChanged()
    {
        guard titleTextField.markedTextRange == nil else {return};
        if titleTextField.unwarppedText.count > kMaxNoteTitleCount
        {
            titleTextField.text =  String(titleTextField.unwarppedText.prefix(kMaxNoteTitleCount));
            showTextHUD("标题最多输入\(kMaxPhotoCount)字符");
            
            DispatchQueue.main.async {
                let end = self.titleTextField.endOfDocument;
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end);
            }
        }
        titleCountlabel.text = "\(kMaxNoteTitleCount - titleTextField.unwarppedText.count)"
    }
    
}
