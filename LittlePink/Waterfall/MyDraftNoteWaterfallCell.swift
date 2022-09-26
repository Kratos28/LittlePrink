//
//  MyDraftNoteWaterfallCell.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/3.
//

import UIKit

class MyDraftNoteWaterfallCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        countLabel.text = "\(UserDefaults.standard.integer(forKey: kDraftNoteCount))"
    }

}
