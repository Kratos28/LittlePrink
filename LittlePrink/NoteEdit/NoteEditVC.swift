//
//  NoteEditVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/25.
//

import UIKit
import YPImagePicker
import SKPhotoBrowser
import MBProgressHUD
import AVKit
class NoteEditVC: UIViewController {

    
    
     var photos = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!
    ];
//    var videoURL :URL = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!
    var videoURL :URL?
    ////
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var isVideo : Bool {videoURL != nil}
    
    var photoCount :Int {photos.count}
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionView.dragInteractionEnabled = true;
    }
}


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

/// MARK: - SKPhotoBrowserDelegate
extension NoteEditVC:SKPhotoBrowserDelegate
{
    func removePhoto(_ browser: SKPhotoBrowser, index: Int, reload: @escaping (() -> Void)) {
        photos.remove(at: index);
        photoCollectionView.reloadData();
        reload();
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
