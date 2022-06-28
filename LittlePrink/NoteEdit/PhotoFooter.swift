//
//  PhotoFooter.swift
//  LittlePrink
//
//  Created by Kratos on 2022/6/28.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
    
    @IBOutlet weak var addPhotoBtn: UIButton!
    
    
    override  func awakeFromNib() {
        self.addPhotoBtn.layer.borderWidth = 1;
        self.addPhotoBtn.layer.borderColor = UIColor.quaternaryLabel.cgColor;
    }
    
}
