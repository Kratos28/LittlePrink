//
//  WaterfallVC-Config.swift
//  LittlePrink
//
//  Created by K on 2022/8/15.
//

import CHTCollectionViewWaterfallLayout
extension WaterfallVC
{
    func config()
    {
        let layout =  self.collectionView.collectionViewLayout as! CHTCollectionViewWaterfallLayout
         layout.columnCount = 2;
         layout.minimumColumnSpacing = kWaterfallPadding
         layout.minimumInteritemSpacing = kWaterfallPadding;
         layout.sectionInset = UIEdgeInsets(top: 0, left: kWaterfallPadding, bottom: kWaterfallPadding, right: kWaterfallPadding);
        if isMyDraft
        {
            layout.sectionInset = UIEdgeInsets(top: 44, left: kWaterfallPadding, bottom: kWaterfallPadding, right: kWaterfallPadding);
        }
    }
}
