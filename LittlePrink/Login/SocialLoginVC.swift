//
//  SocialLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/8/30.
//

import UIKit

class SocialLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func signInWithAlipay(_ sender: UIButton) {
        let infoStr = "apiname=com.alipay.account.auth&app_id=\(kAliPayAppID)&app_name=mc&auth_type=AUTHACCOUNT&biz_type=openservice&method=alipay.open.auth.sdk.code.get&pid=\(kAliPayPID)&product_id=APP_FAST_LOGIN&scope=kuaijie&sign_type=RSA2&target_id=20210122";

        
    }
}
