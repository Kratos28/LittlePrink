//
//  EditProfileTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/24.
//

import UIKit


class EditProfileTableVC: UITableViewController {
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var brithLabel: UILabel!
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
    
    lazy var textField : UITextField =  {
        let textField = UITextField(frame: .zero);
        return textField;
    }();
    
    lazy var genderPickerView : UIStackView =
    {
        let cancelBtn = UIButton();
        setToolBatBtn(cancelBtn, title: "取消", color: .secondaryLabel);
        let doneBtn = UIButton();
        setToolBatBtn(doneBtn, title: "完成", color: .secondaryLabel);
        let toolBarView = UIStackView(arrangedSubviews: [cancelBtn,doneBtn]);
        toolBarView.distribution = .equalSpacing;
        let pickView = UIPickerView();
        pickView.translatesAutoresizingMaskIntoConstraints  = false;
        pickView.heightAnchor.constraint(equalToConstant: 100).isActive = true;
        pickView.dataSource = self;
        pickView.delegate = self;
        
        let genderPickerView = UIStackView(arrangedSubviews: [toolBarView,pickView]);
        genderPickerView.frame.size.height = 150;
        genderPickerView.axis = .vertical;
        genderPickerView.spacing = 5;
        genderPickerView.backgroundColor = .secondarySystemBackground;
        return genderPickerView
         
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.inputView = genderPickerView;
        tableView.addSubview(textField);
        
    }
    
    private func setToolBatBtn(_ btn : UIButton,title:String,color : UIColor){
        btn.setTitle(title, for: .normal);
        btn.titleLabel?.font = .systemFont(ofSize: 14);
        btn.setTitleColor(color, for: .normal);
        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8);
    }
    
    @IBAction func back(_ sender: Any) {
        
    }
    
    
 

  
}

extension EditProfileTableVC :UIPickerViewDelegate,UIPickerViewDataSource
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        ["男","女"][row]
    }
    
}
