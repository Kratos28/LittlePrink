//
//  TextViewIAView.swift
//  LittlePrink
//
//  Created by Kratos on 2022/7/13.
//

import UIKit

class TextViewIAView: UIView {

    @IBOutlet weak var textCountLabel: UILabel!
    @IBOutlet weak var textViewCountStackView: UIStackView!
    
    @IBOutlet weak var maxTextCountLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    
    var currentTextCount = 0{
        didSet
        {
         if currentTextCount <= kMaxNoteTextCount{
              doneBtn.isHidden = false;
             textViewCountStackView.isHidden = true
            }else
            {
                doneBtn.isHidden = true;
                textViewCountStackView.isHidden = false;
                textCountLabel.text = "\(currentTextCount)"
            }
        }
    }
}
