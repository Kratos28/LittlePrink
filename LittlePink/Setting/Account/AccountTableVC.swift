//
//  AccountTableVC.swift
//  LittlePink
//
//  Created by 9130Game on 2023/8/29.
//

import UIKit
import LeanCloud
class AccountTableVC: UITableViewController {

    var user: LCUser! 
    var phoneNum : String?{
        user.mobilePhoneNumber?.value
    }
    var isSetPassword: Bool? {user.get(kIsSetPasswordCol)?.boolValue}
    
    @IBOutlet weak var phoneNumLabel : UILabel!;
    @IBOutlet weak var passwordLabel : UILabel!;
    @IBOutlet weak var appleIDLabel : UILabel!;
    override func viewDidLoad() {
        super.viewDidLoad();
        if let phoneNum = phoneNum{
            phoneNumLabel.setToLight(phoneNum);
        }
        if let _ = isSetPassword{
            phoneNumLabel.setToLight("已设置");

        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordTableVC =  segue.destination as?PasswordTableVC {
            
            passwordTableVC.user = user;
            if isSetPassword == nil{
                passwordTableVC.setPasswordFinshed = {
                    self.phoneNumLabel.setToLight("已设置");
                }
            }
            
          
        }
    }



}
