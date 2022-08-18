//
//  WaterfallVC-Delegate.swift
//  LittlePrink
//
//  Created by K on 2022/8/16.
//

import Foundation

extension WaterfallVC
{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isMyDraft{
            let draftNote =  draftNotes[indexPath.item];
            if let photosData = draftNote.photos,
               let photoDataArr = try? JSONDecoder().decode([Data].self, from: photosData)
            {
               let photos =  photoDataArr.map {
                    UIImage($0) ?? imagePH
                }
               let videoURL =  FileManager.default.save(draftNote.video, to: "video", as: "\(UUID().uuidString).mp4")
                let vc =  storyboard!.instantiateViewController(identifier: kNoteEditVCID) as! NoteEditVC;
                vc.draftNote = draftNote;
                vc.photos = photos;
                vc.videoURL = videoURL;
                vc.updateDraftNoteFinished = {
                    self.getDraftNotes();
                    self.collectionView.reloadData();
                };
                navigationController?.pushViewController(vc, animated: true);
                
            }else
            {
                showTextHUD("加载草稿失败");
            }
        }else
        {
            
        }
    }
}
