//
//  WaterfallVC-DataSource.swift
//  LittlePrink
//
//  Created by K on 2022/8/16.
//

import Foundation

extension WaterfallVC
{
    
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
            cell.deleteBtn.tag = indexPath.item;
            cell.deleteBtn.addTarget(self, action: #selector(showAlert(_:)), for: .touchUpInside);
            return cell

        }else
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: waterfallCellID, for: indexPath) as!     WaterfallCell
            cell.imageview1.image = UIImage(named: "\(indexPath.item + 1)");
            return cell

        }
    }
}
extension WaterfallVC
{
    func deleteDraftNote(_ index : Int)
    {
        
        backgroundContext.perform {
            let draftNote =  self.draftNotes[index];
            backgroundContext.delete(draftNote);
            appDelegate.saveBackgroundContext();
            self.draftNotes.remove(at: index);
     
            DispatchQueue.main.async {
                self.collectionView.reloadData();
                self.showTextHUD("删除草稿成功");
            }
        }
    
    }
}


extension WaterfallVC
{
    @objc func showAlert(_ sender:UIButton)
    {
        let index = sender.tag;
        let alert =  UIAlertController(title: "提示", message: "确认删除该草稿吗?", preferredStyle: .alert);
        let action1 =  UIAlertAction(title: "取消", style: .cancel);
        let action2 =  UIAlertAction(title: "确认", style: .destructive) { _ in
            
            self.deleteDraftNote(index);
        }
        alert .addAction(action1);
        alert .addAction(action2);
        self.present(alert, animated: false);
    }
}
