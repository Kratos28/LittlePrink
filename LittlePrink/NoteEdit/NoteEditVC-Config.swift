//
//  NoteEditVC-Config.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/4.
//

import Foundation


extension NoteEditVC
{
    func config() {
        hideKeyBoardWhenTappedAround();
        photoCollectionView.dragInteractionEnabled = true;
        titleCountlabel.text = "\(kMaxNoteTitleCount)";
        textView.textContainerInset = .zero;
        textView.textContainer.lineFragmentPadding = 0;
        let lineFragmentPadding = textView.textContainer.lineFragmentPadding
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -lineFragmentPadding, bottom: 0, right: -lineFragmentPadding);
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing  = 6
        textView.typingAttributes   = [NSAttributedString.Key.paragraphStyle:paragraphStyle]
    }
}
