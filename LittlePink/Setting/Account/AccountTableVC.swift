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
    
    @IBOutlet weak var phoneNumLabel : UILabel!;
    @IBOutlet weak var passwordLabel : UILabel!;
    @IBOutlet weak var appleIDLabel : UILabel!;
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }



}
