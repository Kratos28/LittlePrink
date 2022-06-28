//
//  NoteEditVC.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/25.
//

import UIKit

class NoteEditVC: UIViewController {

    
     let photos = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3")

    ];
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
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
        self.photos.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellID, for: indexPath) as! photoCell
        
        cell.imageView.image = photos[indexPath.item];

        return cell;
    }
    
    
}
