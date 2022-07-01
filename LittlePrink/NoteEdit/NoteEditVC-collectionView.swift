//
//  NoteEditVC-collectionView.swift
//  LittlePrink
//
//  Created by K on 2022/7/1.
//

import Foundation
import YPImagePicker
import SKPhotoBrowser
import MBProgressHUD
import AVKit
extension NoteEditVC:UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if isVideo
        {
            let playerVC = AVPlayerViewController();
            playerVC.player = AVPlayer(url: videoURL!);
            
            present(playerVC, animated:true) {
                playerVC.player?.play();
            };
        }else
        {
            var images =  [SKPhoto]();
            
            for photo in photos
            {
                images.append(SKPhoto.photoWithImage(photo));
            }
            
            let browser = SKPhotoBrowser(photos:images,initialPageIndex: indexPath.item );
            SKPhotoBrowserOptions.displayAction = false;
            browser.delegate = self;
            SKPhotoBrowserOptions.displayDeleteButton = true;
            present(browser, animated: true);
        }
        
        

    }
}
extension NoteEditVC:UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! photoCell
        
        cell.imageView.image = photos[indexPath.item];

        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
 
    
        
        switch kind {
            case UICollectionView.elementKindSectionFooter:
            let photoFooter =    collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: kphotoFooterID, for: indexPath) as! PhotoFooter;
            
            photoFooter.addPhotoBtn.addTarget(self, action: #selector(addPhoto), for: .touchUpInside);
            return photoFooter;
            
        default:
            fatalError("collectionView的footer出问题了");
        }
    }
    
    
    
}

extension NoteEditVC{
    @objc private func addPhoto()
    {
        if photoCount < kMaxPhotoCount{
            
            var config = YPImagePickerConfiguration();
            config.screens = [.library];
            
            
            config.library.defaultMultipleSelection = true;
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount;
            config.library.spacingBetweenItems = kSpacingBetweenItems
            config.gallery.hidesRemoveButton = false;
            
            
    
            let picker = YPImagePicker(configuration: config);
            picker.didFinishPicking {[unowned picker] items, _ in
                for item in items {
                    if case let .photo(photo) = item {
                        self.photos.append(photo.image);
                    }
                    self.photoCollectionView.reloadData();
                    
                }
                picker.dismiss(animated: true,completion: nil);
            }

            
            
        
    
        }else {
            self.showTextHUD("最多只能选择\(kMaxPhotoCount)张照片哦");
        }
    }
}

