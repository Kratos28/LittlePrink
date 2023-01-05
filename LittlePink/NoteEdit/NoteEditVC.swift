//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 刘军 on 2020/11/27.
//

import UIKit
import LeanCloud

class NoteEditVC: UIViewController {
    
    var draftNote: DraftNote?
    var updateDraftNoteFinished: (() -> ())?
    var postDraftNoteFinished: (() -> ())?
    var note: LCObject?
    var updateNoteFinished : ((String) -> ())?
    
    var photos: [UIImage] = []
    
    //var videoURL: URL? = Bundle.main.url(forResource: "TV", withExtension: "mp4")
    var videoURL: URL?
    
    var channel = ""
    var subChannel = ""
    var poiName = ""
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var photoCollectionview: UICollectionView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var titleCountLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelPlaceholderLabel: UILabel!
    @IBOutlet weak var poiNameIcon: UIImageView!
    @IBOutlet weak var poiNameLabel: UILabel!
    
    var photoCount: Int{ photos.count }
    var isVideo: Bool { videoURL != nil }
    var textViewIAView: TextViewIAView{ textView.inputAccessoryView as! TextViewIAView }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setUI()
    }
    
    @IBAction func TFEditBegin(_ sender: Any) { titleCountLabel.isHidden = false }
    
    @IBAction func TFEditEnd(_ sender: Any) { titleCountLabel.isHidden = true }
    //点击软键盘的完成按钮收起软键盘(和在textFieldShouldReturn里面resignFirstResponder是一个效果)
    @IBAction func TFEndOnExit(_ sender: Any) {}
    
    @IBAction func TFEditChanged(_ sender: Any) { handleTFEditChanged() }
    
    @IBAction func saveDraftNote(_ sender: Any) {
        guard isValidateNote() else { return }
        
        if let draftNote = draftNote{//更新草稿
            updateDraftNote(draftNote)
        }else{//创建草稿
            createDraftNote()
        }
    }
    
    @IBAction func postNote(_ sender: Any) {
        guard isValidateNote() else { return }
        
        if let draftNote = draftNote{//发布草稿笔记
            postDraftNote(draftNote)
        }else if let note = note{
            //更新笔记
            updateNote(note);
        }else
        {
            //发布新笔记
            createNote()

        }
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let channelVC = segue.destination as? ChannelVC{
            view.endEditing(true)
            channelVC.PVDelegate = self
        }else if let poiVC = segue.destination as? POIVC{
            poiVC.delegate = self
            poiVC.poiName = poiName
        }
    }
    
}
// MARK: - UITextViewDelegate
extension NoteEditVC: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        guard textView.markedTextRange == nil else { return }
        textViewIAView.currentTextCount = textView.text.count
    }
}
// MARK: - ChannelVCDelegate
extension NoteEditVC: ChannelVCDelegate{
    func updateChannel(channel: String, subChannel: String) {
        //数据
        self.channel = channel
        self.subChannel = subChannel
        //UI
        updateChannelUI()
    }
}
// MARK: - POIVCDelegate
extension NoteEditVC: POIVCDelegate{
    func updatePOIName(_ poiName: String) {
        //数据
        if poiName == kPOIsInitArr[0][0]{
            self.poiName = ""
        }else{
            self.poiName = poiName
        }
        //UI
        updatePOINameUI()
    }
}

// MARK: - 因系统自带拼音键盘把拼音也当做字符,故需在输入完之后判断,故全部移到TFEditChanged方法中进行处理
//extension NoteEditVC: UITextFieldDelegate{
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        //range.location--当前输入的字符或粘贴文本的第一个字符的索引
//        //string--当前输入的字符或粘贴的文本
//
//        //限制字串长度为20，以下情况返回false（即不让输入）：
//        //1-输入的字符或粘贴的文本在整体内容的索引是20的时候（第21个字符不让输）
//        //2-当前输入的字符的长度+粘贴文本的长度超过20时--防止从一开始一下子粘贴超过20个字符的文本
//        let isExceed = range.location >= kMaxNoteTitleCount || (textField.unwrappedText.count + string.count > kMaxNoteTitleCount)
//
//        if isExceed{ showTextHUD("标题最多输入\(kMaxNoteTitleCount)字哦") }
//
//        return !isExceed
//    }
//}
