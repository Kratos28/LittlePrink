//
//  WaterfallVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/5.
//

import UIKit
import CHTCollectionViewWaterfallLayout
import XLPagerTabStrip



class WaterfallVC: UICollectionViewController ,CHTCollectionViewDelegateWaterfallLayout {
    
    var draftNotes : [DraftNote] = [];
    var channel = "";
    var isMyDraft = true;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.config();
        self.getDraftNotes();
    }





}

//MARK: - fallLayout
extension WaterfallVC
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellW = (screenRect.width - kWaterfallPadding * 3) / 2;
        var cellH : CGFloat = 0;
        if isMyDraft
        {
            let draftNote = draftNotes[indexPath.item];
            let imageSize = UIImage(draftNote.coverPhoto)?.size ?? imagePH.size;
            let imageH = imageSize.height;
            let imageW = imageSize.width;
            let imageRatio = imageH / imageW;
            cellH = cellW * imageRatio  + kDraftNoteWaterfallCellBottomViewH;
            
        }else
        {
            cellH = UIImage(named: "\(indexPath.item + 1)")!.size.height;
        }
        return CGSize(width: cellW, height: cellH);
    }

}
extension WaterfallVC :IndicatorInfoProvider
{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel);
    }
    
    
}
