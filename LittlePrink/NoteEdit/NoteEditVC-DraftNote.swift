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
        backgroundContext.perform {
            let dratNote =  DraftNote(context:backgroundContext);
            
            if self.isVideo
            {
                dratNote.video = try? Data(contentsOf: self.videoURL!);
            }
            
            self.handlePhotos(dratNote);

            dratNote.isVideo = self.isVideo;
            self.handleOthers(dratNote: dratNote);
            DispatchQueue.main.async {
                self.showTextHUD("保存草稿成功");
            }
        }
        dismiss(animated: true);
    }
    
    func updateDraftNote(dratNote : DraftNote){
        backgroundContext.perform {
            if !self.isVideo{
                self.handlePhotos(dratNote);
            }
            self.handleOthers(dratNote: dratNote);
            self.updateDraftNoteFinished?();
            
            DispatchQueue.main.async {
                self.updateDraftNoteFinished?();
            }
        }
        navigationController?.popViewController(animated: true);

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
        DispatchQueue.main.async {
            dratNote.title = self.titleTextField.exactText;
            dratNote.text = self.textView.exactText;
        }
        
  
        dratNote.channel =  channel;
        dratNote.subchannel  = subChannel;
        dratNote.poiName = poiName;
        dratNote.updatedAt = Date();
        appDelegate.saveBackgroundContext();

    }
    
}
