//
//  IntroVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import UIKit

class IntroVC: UIViewController{

    var intro = "";
    var delegate : IntrolVCDelegate?;
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder(); 
        textView.text = intro;
        countLabel.text = "\(kMaxIntroCount)";
        // Do any additional setup after loading the view.
    }
    

    @IBAction func down(_ sender: Any)
    {
        if !textView.isBlank{
            delegate?.updateIntro(textView.exactText);
        }
        dismiss(animated: true);
    }
    
}

extension IntroVC:UITextViewDelegate
{
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else {return};
        countLabel.text = "\(kMaxIntroCount - textView.text.count)";
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let isExceed = range.location >= kMaxIntroCount || (textView.text.count + text.count > kMaxIntroCount)
        if isExceed{
            showTextHUD("个人简介最多输入100字")
        }
        
        return !isExceed;
    }
}
