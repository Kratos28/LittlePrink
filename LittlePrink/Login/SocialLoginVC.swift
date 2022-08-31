//
//  SocialLoginVC.swift
//  LittlePrink
//
//  Created by K on 2022/8/30.
//

import UIKit
import Alamofire
class SocialLoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func signInWithAlipay(_ sender: UIButton) {
        let infoStr = "apiname=com.alipay.account.auth&app_id=\(kAliPayAppID)&app_name=mc&auth_type=AUTHACCOUNT&biz_type=openservice&method=alipay.open.auth.sdk.code.get&pid=\(kAliPayPID)&product_id=APP_FAST_LOGIN&scope=kuaijie&sign_type=RSA2&target_id=20210122";
                
        guard let signer =  APRSASigner(privateKey: "支付宝创建的私钥"),let signedStr   = signer.sign(infoStr, withRSA2: true) else {return;}
        let authInfoStr = "\(infoStr)&sign=\(signedStr)";
        AlipaySDK.defaultService().auth_V2(withInfo: authInfoStr, fromScheme: kAppScheme) { result in
            guard let res = result else{return}
            let resStatus = res["resultStatus"] as! String
            if resStatus == "9000"{
                let resStr = res["result"] as! String
                
                let resArr = resStr.components(separatedBy: "&");
                for subRes in resArr{
                    let equalIndex = subRes.firstIndex(of: "=")!;
                    let equalEndIndex =  subRes.index(after: equalIndex);
                    let prefix = subRes[..<equalIndex];
                    let suffix = subRes[equalEndIndex...];
                    print(prefix);
                    if subRes.hasPrefix("auth_code")
                    {
                        print("authCode = \(suffix)");
                        let parameters = [
                            "timestamp":Date().format(with: "yyyy-MM-dd HH:mm:ss"),
                            "method":"alipay.system.oauth.token",
                            "app_id":kAliPayPID,
                            "sign_type":"RSA2",
                            "version":"1.0",
                            "charset":"utf-8",
                            "grant_type":"authorization_code",
                            "code":String(suffix)
                        ];
                        AF.request("https://openapi.alipay.com/gateway.do", parameters: parameters)
                        
                    }
                }
                
            }
        };
        
        
    }
}
