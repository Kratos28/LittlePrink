//
//  EditProfileTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import UIKit
import ActionSheetPicker_3_0
import LeanCloud
class EditProfileTableVC: UITableViewController {
    
    var user :LCUser!
    var delegate: EditProfileTableVCDelegate?
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var avatar : UIImage?{
        didSet{
            DispatchQueue.main.async
            {
                self.avatarImageView.image =  self.avatar;
            }
        }
    }
    var gender = false
    {
        didSet
        {
            genderLabel.text = gender ? "男" : "女"
        }
    }
    var nickName = "" {
        didSet
        {
            nickNameLabel.text = nickName;
        }
    }
    
    var birth: Date?{
        didSet{
            if let birth = birth{
                birthLabel.text = birth.format(with: "yyyy-MM-dd");
            }else{
                birthLabel.text = "未填写"
            }
        }
    }
    
    var intro = ""{
        didSet{
            introLabel.text =  intro.isEmpty ? "未填写": intro
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI();
        
        
//        textField.inputView = genderPickerView;
//        tableView.addSubview(textField);
        
    }
    
   
    
    @IBAction func back(_ sender: Any) {
        
        delegate?.updateUser(avatar, nickName, gender, birth,intro);
        dismiss(animated:true);
    }
    
    
//    private func setToolBatBtn(_ btn : UIButton,title:String,color : UIColor){
//        btn.setTitle(title, for: .normal);
//        btn.titleLabel?.font = .systemFont(ofSize: 14);
//        btn.setTitleColor(color, for: .normal);
//        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8);
//    }
//
//    lazy var textField : UITextField =  {
//        let textField = UITextField(frame: .zero);
//        return textField;
//    }();
//
//    lazy var genderPickerView : UIStackView =
//    {
//        let cancelBtn = UIButton();
//        setToolBatBtn(cancelBtn, title: "取消", color: .secondaryLabel);
//        let doneBtn = UIButton();
//        setToolBatBtn(doneBtn, title: "完成", color: .secondaryLabel);
//        let toolBarView = UIStackView(arrangedSubviews: [cancelBtn,doneBtn]);
//        toolBarView.distribution = .equalSpacing;
//        let pickView = UIPickerView();
//        pickView.translatesAutoresizingMaskIntoConstraints  = false;
//        pickView.heightAnchor.constraint(equalToConstant: 100).isActive = true;
//        pickView.dataSource = self;
//        pickView.delegate = self;
//
//        let genderPickerView = UIStackView(arrangedSubviews: [toolBarView,pickView]);
//        genderPickerView.frame.size.height = 150;
//        genderPickerView.axis = .vertical;
//        genderPickerView.spacing = 5;
//        genderPickerView.backgroundColor = .secondarySystemBackground;
//        return genderPickerView
//
//    }();
//
}

//extension EditProfileTableVC :UIPickerViewDelegate,UIPickerViewDataSource
//{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1;
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return 2;
//    }
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        ["男","女"][row]
//    }
//
//}
