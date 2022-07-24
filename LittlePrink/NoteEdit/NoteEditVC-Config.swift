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
        paragraphStyle.lineSpacing  = 6;
        let typingAttributes:[NSAttributedString.Key:Any] = [
            .paragraphStyle:paragraphStyle,
            .font:UIFont.systemFont(ofSize: 14),
            .foregroundColor : UIColor.secondaryLabel
            
        ];
        textView.typingAttributes   = typingAttributes;
        textView.tintColorDidChange();
        let   view = Bundle.main.loadNibNamed("TextViewIAView", owner: nil, options: nil)?.first as! TextViewIAView;
        textView.inputAccessoryView = view;
        
        TextViewIAView.doneBtn.addTarget(self, action: #selector(resignTextView), for: .touchUpInside);
        TextViewIAView.maxTextCountLabel.text = "/\(kMaxNoteTextCount)";
        locationManager.requestWhenInUseAuthorization();
        AMapLocationManager.updatePrivacyShow(.didShow, privacyInfo: .didContain)
        AMapLocationManager.updatePrivacyAgree(.didAgree);
//        AMapSearchAPI.updatePrivacyShow(.didShow, privacyInfo: .didContain)
//        AMapSearchAPI.updatePrivacyAgree(.didAgree);
        
        
    }
}

extension NoteEditVC
{
     @objc private func resignTextView()
    {
        textView.resignFirstResponder();
    }
}
