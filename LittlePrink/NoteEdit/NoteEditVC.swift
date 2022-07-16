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

    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountlabel: UILabel!

     var photos = [
        UIImage(named: "1")!,
    ];
//    var videoURL :URL = Bundle.main.url(forResource: "testVideo", withExtension: "mp4")!
    var videoURL :URL?
    ////
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var isVideo : Bool {videoURL
        != nil}
    var photoCount :Int {photos.count}
    var TextViewIAView: TextViewIAView{textView.inputAccessoryView as!TextViewIAView;}
    override func viewDidLoad() {
        super.viewDidLoad();
        config();
      
    }
    
    
    
    
    @IBAction func TFEditingBegin(_ sender: UITextField) {
        titleCountlabel.isHidden = false;
    }
    @IBAction func TFEditingEnd(_ sender: UITextField) {
        titleCountlabel.isHidden = true;
    }
    @IBAction func TFEndOnExit(_ sender: Any) {
        //什么不用代码
        
    }
    @IBAction func TFEditChanged(_ sender: Any) {
        
        guard titleTextField.markedTextRange == nil else {return};
        if titleTextField.unwarppedText.count > kMaxNoteTitleCount
        {
            titleTextField.text =  String(titleTextField.unwarppedText.prefix(kMaxNoteTitleCount));
        }
        titleCountlabel.text = "\(kMaxNoteTitleCount - titleTextField.unwarppedText.count)"
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

extension NoteEditVC:UITextViewDelegate
{
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else {
            return;
        }
        TextViewIAView.currentTextCount = textView.text.count;
    }
}


extension NoteEditVC:UITextFieldDelegate
{
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool
//    {
//        textField.resignFirstResponder()
//        return true;
//    }
        

    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        
        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwarppedText.count + string.count) > kMaxNoteTitleCount;
    
        if isExceed
        {
            showTextHUD("标题最多输入\(kMaxNoteTitleCount)字");
        }
        return !isExceed;
    }
    
    
}
