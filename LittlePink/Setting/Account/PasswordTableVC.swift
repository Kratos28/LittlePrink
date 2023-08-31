//
//  PasswordTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/30.
//

import UIKit

class PasswordTableVC: UITableViewController {

    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var cofirmPasswordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

   
    @IBAction func done(_ sender: Any) {
    }
    
    
    @IBAction func TFEditChange(_ sender:Any){
        if passwordTF.isBlank || cofirmPasswordTF.isBlank{
            doneBtn.isEnabled = false;
        }else {
            doneBtn.isEnabled = true;
        }
    }
}
extension PasswordTableVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
}
