//
//  NoteEditVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/25.
//

import UIKit
import YPImagePicker
class NoteEditVC: UIViewController {

    
     var photos = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3")
    ];
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoCount :Int {photos.count}
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


extension NoteEditVC:UICollectionViewDelegate
{
    
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
            
        }
    }
}
