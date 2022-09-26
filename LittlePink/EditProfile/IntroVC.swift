//
//  IntroVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/8.
//

import UIKit

class IntroVC: UIViewController {
    
    var intro = ""
    var delegate: IntroVCDelegate?

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.becomeFirstResponder()
        textView.text = intro
        countLabel.text = "\(kMaxIntroCount)"
    }
    @IBAction func done(_ sender: Any) {
        
        delegate?.updateIntro(textView.exactText)

        dismiss(animated: true)
    }
}

extension IntroVC: UITextViewDelegate{
    //剩余可输入字数
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else { return }
        countLabel.text = "\(kMaxIntroCount - textView.text.count)"
    }
    //限制输入字数
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let isExceed = range.location >= kMaxIntroCount || (textView.text.count + text.count > kMaxIntroCount)
        if isExceed{ showTextHUD("个人简介最多输入\(kMaxIntroCount)字哦") }
        return !isExceed
    }
}
