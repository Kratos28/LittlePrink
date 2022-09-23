//
//  NoteEditVC-UI.swift
//  LittlePrink
//
//  Created by K on 2022/8/16.
//

import Foundation
import PopupDialog
extension NoteEditVC
{
    func setUI()
    {
        self.addPopup();
        setDraftNoteEditUI();
    }

}


extension NoteEditVC
{
    func setDraftNoteEditUI()
    {
        if let draftNote = draftNote{
            titleTextField.text = draftNote.title!;
            textView.text = draftNote.text;
            channel = draftNote.channel!;
            subChannel = draftNote.subchannel!;
            poiName = draftNote.poiName!;
            if !subChannel.isEmpty{
                updateChannelUI();
            }
            if !poiName.isEmpty{
                updatePOINameUI();
            };
        }
    }
    
     func updateChannelUI()
    {
        
        ChannelIcon.tintColor = blueColor;
        channelLabel.text = subChannel;
        channelLabel.textColor = blueColor;
        channelPlaceholderLabel.isHidden = true;
    }
    func updatePOINameUI(){
        if poiName == "" {
            self.poiNameIcon.tintColor = .label;
            poiNameLabel.text = "添加地点";
            poiNameLabel.textColor = .label;
        }else
        {
            self.poiNameIcon.tintColor = blueColor;
            self.poiNameLabel.text = poiName;
            self.poiNameLabel.textColor = blueColor;

        }
            
    }
}

extension NoteEditVC
{
    func addPopup()
    {
        let icon =  largeIcon("info.circle");
        navigationItem.rightBarButtonItem =  UIBarButtonItem(image:icon,style: .plain, target: self, action: #selector(showPopup));
        let pv = PopupDialogDefaultView.appearance();
        pv.titleColor = .label;
        pv.messageFont = .systemFont(ofSize: 13);
        pv.messageColor = .secondaryLabel;
        pv.messageTextAlignment = .natural;
        
        let cb = CancelButton.appearance();
        cb.titleColor = .label;
        cb.separatorColor = mainColor;
        
        let pcv = PopupDialogContainerView.appearance();
        pcv.backgroundColor = .secondarySystemBackground;
        pcv.cornerRadius = CGFloat(10);
        
    }
}

extension NoteEditVC
{
    @objc func showPopup()
    {
        let title = "发布小提示";
        let message =
        """
         dsfsdfsdfdsfsdfdsfdsfdsfdsfsd
         dsfsdfsdfdsfsdfdsfdsfdsfdsfsd
        """;
        let popup = PopupDialog(title:title, message:message, transitionStyle: .zoomIn);
        let btn = CancelButton(title: "知道了", action: nil);
        popup.addButton(btn);
        present(popup, animated: false);
        
    }
}
