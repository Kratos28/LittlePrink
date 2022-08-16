//
//  NoteEditVC-DraftNote.swift
//  LittlePrink
//
//  Created by K on 2022/8/16.
//

import Foundation

extension NoteEditVC
{
    func createDraftNote()
    {
        let dratNote =  DraftNote(context:context);
        
        if isVideo
        {
            dratNote.video = try? Data(contentsOf: videoURL!);
        }
        
        handlePhotos(dratNote);

        dratNote.isVideo = isVideo;
        handleOthers(dratNote: dratNote);

        
    }
    
    func updateDraftNote(dratNote : DraftNote){
        
        if !isVideo{
            handlePhotos(dratNote);
        }
        handleOthers(dratNote: dratNote);
    
    }
}

extension NoteEditVC
{
    private func handlePhotos( _ dratNote: DraftNote)
    {
        dratNote.coverPhoto = photos[0].jpeg(.high);
        var photos:[Data] = [];
        for photo in self.photos
        {
         if let  photoData =  photo.pngData()
         {
             photos.append(photoData)
         }
        }
        
        dratNote.photos =   try? JSONEncoder().encode(photos);

    }
    
    private func handleOthers( dratNote: DraftNote){
        dratNote.title = titleTextField.exactText;
        dratNote.text = textView.exactText;
        dratNote.channel =  channel;
        dratNote.subchannel  = subChannel;
        dratNote.poiName = poiName;
        dratNote.updatedAt = Date();
        appDelegate.saveContext();

    }
    
}
