//
//  NoteEditVC-UI.swift
//  LittlePrink
//
//  Created by K on 2022/8/16.
//

import Foundation
extension NoteEditVC
{
    func setUI()
    {
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
