//
//  MyDraftNoteWaterfallCell.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/23.
//

import UIKit

class MyDraftNoteWaterfallCell: UICollectionViewCell {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override  func awakeFromNib() {
        countLabel.text = "\(UserDefaults.standard.integer(forKey: kDraftNoteCount))";
    }
}
