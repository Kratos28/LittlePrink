//
//  PasswordTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/30.
//

import UIKit
import LeanCloud
class PasswordTableVC: UITableViewController {
    
    var user:LCUser!
    var setPasswordFinshed:(()->())?
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    private var passwordStr: String{passwordTF.unwrappedText;}
    private var confirmPasswordStr: String{confirmPasswordTF.unwrappedText;}
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.becomeFirstResponder();
     
    }

   
    @IBAction func done(_ sender: UIButton)
    {
        if passwordStr.isPassword && confirmPasswordStr.isPassword
        {
            if passwordStr == confirmPasswordStr{
                
                
                user.password = LCString(passwordStr);
                try? user.set(kIsSetPasswordCol, value: true);
                user.save{_ in}
                dismiss(animated: true);
                setPasswordFinshed?();
            }else {
                showTextHUD("再次密码不一致");

            }
            
        }else
        {
            showTextHUD("密码必须为6-16的数字");
        }
    }
    
    
    @IBAction func TFEditChange(_ sender:Any){
        if passwordTF.isBlank || confirmPasswordTF.isBlank{
            doneBtn.isEnabled = false;
        }else {
            doneBtn.isEnabled = true;
        }
        
    }
}
extension PasswordTableVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField{
        case passwordTF:
                confirmPasswordTF.becomeFirstResponder();
        default:
            if doneBtn.isEnabled
            {
                done(doneBtn);
            }
        }
        
        return true;
    }
}
