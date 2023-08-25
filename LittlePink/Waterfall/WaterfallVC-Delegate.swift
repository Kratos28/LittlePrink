

import Foundation

extension WaterfallVC{
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isMyDraft,indexPath.item == 0 {
          let navi =   storyboard!.instantiateViewController(withIdentifier: kDraftNotesNaviID) as! UINavigationController
            navi.modalPresentationStyle = .fullScreen;
            ((navi.topViewController) as! WaterfallVC).isDraft = true;
            present(navi, animated: true);
        }else if isDraft{
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
            let offset = isMyDraft ? 1 :0
            let item = indexPath.item - offset;
            //依赖注入(Dependency Injection)
            let detailVC = storyboard!.instantiateViewController(identifier: kNoteDetailVCID) { coder in
                NoteDetailVC(coder: coder, note: self.notes[item])
            }
            
            if let cell = collectionView.cellForItem(at: indexPath) as? WaterfallCell
            {
                detailVC.isLikeFormWaterfallCell = cell.isLike;
            }
            detailVC.delNoteFinished = {
                self.notes.remove(at: item);
                collectionView.performBatchUpdates {
                    collectionView.deleteItems(at: [indexPath]);
                }
            }
            detailVC.isFromMeVC = isFromMeVC;
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true)
        }
    }
}
