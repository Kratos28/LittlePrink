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
import CoreLocation
import LeanCloud
class NoteEditVC: UIViewController {

    var draftNote: DraftNote?
    var updateDraftNoteFinished : (()->())?
     let locationManager  = CLLocationManager();
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountlabel: UILabel!

    
    @IBOutlet weak var poiNameLabel: UILabel!
    
    @IBOutlet weak var poiNameIcon: UIImageView!
    
    
    @IBOutlet weak var channelPlaceholderLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var ChannelIcon: UIImageView!
    var photos : [UIImage] = [];
        var videoURL :URL?
//    var videoURL :URL? = Bundle.main.url(forResource: "testVideo", withExtension: "mp4");
    
    var channel = "";
    var subChannel = "";
    var poiName = "";
    
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var isVideo : Bool {videoURL
        != nil}
    var photoCount :Int {photos.count}
    var TextViewIAView: TextViewIAView{textView.inputAccessoryView as!TextViewIAView;}
    override func viewDidLoad() {
        super.viewDidLoad();
        
        
        config();
        
        setUI();

//        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
//        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0];
        
    }
    
    
    @IBAction func saveDratNote(_ sender: Any) {
      guard  self.isValidateNote() else
        {
          return;
      }

        if let dratNote  = self.draftNote{
            updateDraftNote(dratNote: dratNote);
        }else
        {
            createDraftNote();
        }
        
       
    }
    
    @IBAction func postNote(_ sender: Any) {
        guard  self.isValidateNote() else
        {
            return;
        }
        
        do {
          let note =   LCObject(className: knoteTable);
            try note.set(kTitleCol, value: titleTextField.exactText);
            try note.set(kTextCol, value: textView.exactText);
            try note.set(kChannelCol, value: channel.isEmpty ? "推荐" : channel);
            try note.set(kSubChannelCol, value: subChannel);
            try note.set(kPOINameCol, value: poiName);
            note.save { res in
                
            }
        }catch
        {
            print("存笔记进云端失败: \(error)");
        }
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
        handeleTFEditChanged();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let channelVC = segue.destination as? ChannelVC{
            view.endEditing(true);
            channelVC.PVdelegate = self;
        } else if let poiVC = segue.destination as? POIVC
        {
            poiVC.delegate = self;
            poiVC.poiName = poiName;
        }
    }
}

extension NoteEditVC:ChannelVCDelegate
{
    func updateChannel(channel: String, subChannel: String) {
        
        self.channel = channel;
        self.subChannel = subChannel;
        updateChannelUI()
        
    }
}
extension NoteEditVC: POIVCDelegate {
    
    func updatePOIName( _ poiName: String)
    {
        
        if poiName == kPOIsInitArr[0][0]
        {
            self.poiName = "";
        
            
        }else
        {
            self.poiName = poiName;
            
        }
        updatePOINameUI();
        
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
