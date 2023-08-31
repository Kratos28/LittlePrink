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
    @IBOutlet weak var phoneNumLabel : UILabel!;
    @IBOutlet weak var passwordLabel : UILabel!;
    @IBOutlet weak var appleIDLabel : UILabel!;
    override func viewDidLoad() {
        super.viewDidLoad();
        
        if let phoneNum = phoneNum{
            phoneNumLabel.text = phoneNum;
        }
        
    }



}
