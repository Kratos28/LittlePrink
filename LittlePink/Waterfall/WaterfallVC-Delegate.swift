//
//  WaterfallVC-Delegate.swift
//  LittlePink
//
//  Created by 刘军 on 2021/1/5.
//

import Foundation

extension WaterfallVC{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isDraft{
            let draftNote = draftNotes[indexPath.item]
            
            if let photosData = draftNote.photos,
               let photosDataArr = try? JSONDecoder().decode([Data].self, from: photosData){
                
                let photos = photosDataArr.map { UIImage($0) ?? imagePH }
                
                let videoURL = FileManager.default.save(draftNote.video, to: "video", as: "\(UUID().uuidString).mp4")
                
                let vc = storyboard!.instantiateViewController(identifier: kNoteEditVCID) as! NoteEditVC
                vc.draftNote = draftNote
                vc.photos = photos
                vc.videoURL = videoURL
                //更新草稿后刷新所有草稿
                vc.updateDraftNoteFinished = {
                    self.getDraftNotes()
                }
                //发布草稿后刷新所有草稿
                vc.postDraftNoteFinished = {
                    self.getDraftNotes()
                }
                
                navigationController?.pushViewController(vc, animated: true)
                
            }else{
                showTextHUD("加载草稿失败")
            }
            
            
        }else{
            //依赖注入(Dependency Injection)
            let detailVC = storyboard!.instantiateViewController(identifier: kNoteDetailVCID) { coder in
                NoteDetailVC(coder: coder, note: self.notes[indexPath.item])
            }
            
            if let cell = collectionView.cellForItem(at: indexPath) as? WaterfallCell
            {
                detailVC.isLikeFormWaterfallCell = cell.isLike;
            }
            detailVC.delNoteFinished = {
                self.notes.remove(at: indexPath.item);
                collectionView.performBatchUpdates {
                    collectionView.deleteItems(at: [indexPath]);
                }
            }
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true)
        }
    }
}
