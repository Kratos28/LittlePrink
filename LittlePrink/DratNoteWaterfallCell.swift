//
//  DratNoteWaterfallCell.swift
//  LittlePrink
//
//  Created by Kratos on 2022/8/14.
//

import UIKit

class DratNoteWaterfallCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var isVideoImageView: UIImageView!
    
    var draftNote: DraftNote?
    {
        didSet
        {
            guard let draftNote = draftNote else {return };
            imageView.image =  UIImage(data: draftNote.coverPhoto!) ?? imagePH;
            let title = draftNote.title!;
            titleLabel.text = title.isEmpty ? "无题" : title;
            dateLabel.text = draftNote.updatedAt?.formattedDate;
            isVideoImageView.isHidden = !draftNote.isVideo;
            
        }
    }



}
