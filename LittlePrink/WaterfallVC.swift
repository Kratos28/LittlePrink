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



    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if isMyDraft
        {
            return draftNotes.count;
        }else
        {
            return 13;

        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isMyDraft
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kDratNoteWaterfallCellID, for: indexPath) as! DratNoteWaterfallCell;
            cell.draftNote = draftNotes[indexPath.item];
            return cell

        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: waterfallCellID, for: indexPath) as!     WaterfallCell
            cell.imageview1.image = UIImage(named: "\(indexPath.item + 1)");
            return cell

        }
        
    
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

//MARK: - fallLayout
extension WaterfallVC
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellW = (UIScreen.main.bounds.width - kWaterfallPadding * 3) / 2;
       return UIImage(named: "\(indexPath.item + 1)")!.size;
    }

}
extension WaterfallVC :IndicatorInfoProvider
{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        IndicatorInfo(title: channel);
    }
    
    
}
