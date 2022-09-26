//
//  EditProfileTableVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/10.
//

import UIKit
import LeanCloud

class EditProfileTableVC: UITableViewController {
    
    var user: LCUser!
    var delegate: EditProfileTableVCDelegate?
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var introLabel: UILabel!
    
    var avatar: UIImage?{
        didSet{
            DispatchQueue.main.async {
                self.avatarImageView.image = self.avatar
            }
        }
    }
    var nickName = ""{
        didSet{
            nickNameLabel.text = nickName
        }
    }
    var gender = false{
        didSet{
            genderLabel.text = gender ? "男" : "女"
        }
    }
    var birth: Date?{
        didSet{
            if let birth = birth{
                birthLabel.text = birth.format(with: "yyyy-MM-dd")
            }else{
                birthLabel.text = "未填写"
            }
        }
    }
    var intro = ""{
        didSet{
            introLabel.text = intro.isEmpty ? "未填写" : intro
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        //textfield.inputView = genderPickerView
        //tableView.addSubview(textfield)
    }

    @IBAction func back(_ sender: Any) {
        //可用5个flag变量判断用户是否修改过,若其中一个改过才调用updateUser--此处省略
        //若传的值比较多,可考虑传一个自定义的对象,然后在MeVC那里从这个对象的属性里获取这些值
        delegate?.updateUser(avatar, nickName, gender, birth, intro)
        dismiss(animated: true)
    }
    
    
    
    
    

    //注释掉的代码为:用代码创建view,并设textfield的inputView属性,以自定义原本的软键盘view
    
//    lazy var textfield: UITextField = {
//        let textfield = UITextField(frame: .zero)
//        return textfield
//    }()
//
//    lazy var genderPickerView: UIStackView = {
//        let cancelBtn = UIButton()
//        setToolBarBtn(cancelBtn, title: "取消", color: .secondaryLabel)
//        let doneBtn = UIButton()
//        setToolBarBtn(doneBtn, title: "完成", color: mainColor)
//        let toolBarView = UIStackView(arrangedSubviews: [cancelBtn, doneBtn])
//        toolBarView.distribution = .equalSpacing
//
//        let pickerView = UIPickerView()
//        pickerView.dataSource = self
//        pickerView.delegate = self
//
//        let genderPickerView = UIStackView(arrangedSubviews: [toolBarView, pickerView])
//        genderPickerView.frame.size.height = 150
//        genderPickerView.axis = .vertical
//        genderPickerView.spacing = 8
//        genderPickerView.backgroundColor = .secondarySystemBackground
//
//        return genderPickerView
//
//    }()
    
//    private func setToolBarBtn(_ btn: UIButton, title: String, color: UIColor){
//        btn.setTitle(title, for: .normal)
//        btn.titleLabel?.font = .systemFont(ofSize: 14)
//        btn.setTitleColor(color, for: .normal)
//        btn.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//    }

}

//extension EditProfileTableVC: UIPickerViewDataSource, UIPickerViewDelegate{
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        2
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        ["男","女"][row]
//    }
//}
