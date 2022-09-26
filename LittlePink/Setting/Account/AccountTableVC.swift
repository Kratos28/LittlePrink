//
//  AccountTableVC.swift
//  LittlePink
//
//  Created by 刘军 on 2021/4/16.
//

import UIKit
import LeanCloud

class AccountTableVC: UITableViewController {
    
    var user: LCUser!
    var phoneNumStr: String? { user.mobilePhoneNumber?.value }
    var isSetPassword: Bool? { user.get(kIsSetPasswordCol)?.boolValue }

    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var appleIDLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: 初始UI
        if let phoneNumStr = phoneNumStr{
            phoneNumLabel.setToLight(phoneNumStr)
        }
        if let _ = isSetPassword{
            passwordLabel.setToLight("已设置")
        }
        if let authData = user.authData?.value{
            //判断字典中是否有某个key的两种方法:
            //1.authData["lc_apple"] != nil
            //2.如下
            let keys = authData.keys
            if keys.contains("lc_apple"){
                appleIDLabel.setToLight(user.getExactStringVal(kNickNameCol))
            }
            
            //其余第三方登录绑定的判断
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordTableVC = segue.destination as? PasswordTableVC{
            passwordTableVC.user = user
            if isSetPassword == nil{
                passwordTableVC.setPasswordfinished = {
                    self.passwordLabel.setToLight("已设置")
                }
            }
        }
    }
    

}
