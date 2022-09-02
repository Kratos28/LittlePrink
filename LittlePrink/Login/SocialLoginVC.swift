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
    
    @IBAction func signInWithApple(_ sender: Any) {
        
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
                        self.getToken(String(suffix));
                    }
                }
                
            }
        };
        
        
    }
}

extension SocialLoginVC
{
    private func getToken(_ authCode :String)
    {
        
            var  parameters = [
                "timestamp":Date().format(with: "yyyy-MM-dd HH:mm:ss"),
                "method":"alipay.system.oauth.token",
                "app_id":kAliPayPID,
                "sign_type":"RSA2",
                "version":"1.0",
                "charset":"utf-8",
                "grant_type":"authorization_code",
                "code":String(authCode)
            ];
  
            AF.request("https://openapi.alipay.com/gateway.do", parameters: self.signedParameters(parameters)).responseDecodable(of: TokenResponse.self) { reponse in
                if let tokenResponse = reponse.value{
                    let accessToken =  tokenResponse.alipay_system_oauth_token_response.access_token;
              
                    self.getINfo(accessToken)
                }
                
            }
            
    }
    private func getINfo(_ accessToken :String){
        let  parameters : [String:String] =  [
            "timestamp":Date().format(with: "yyyy-MM-dd HH:mm:ss"),
            "method":"alipay.user.info.share",
            "app_id":kAliPayPID,
            "sign_type":"RSA2",
            "version":"1.0",
            "charset":"utf-8",
            "auth_token":accessToken
        ]
        
        AF.request("https://openapi.alipay.com/gateway.do", parameters: self.signedParameters(parameters)).responseDecodable(of: InfoShareReponse.self) { response in
            if let  infoShareReponse = response.value {
                let info = infoShareReponse.alipay_user_info_share_response;
                
            }
        }
    }
    
}
extension SocialLoginVC{
    struct TokenResponse:Decodable {
        let alipay_system_oauth_token_response : TokenResponseInfo
        struct TokenResponseInfo :Decodable {
            let access_token:String
        }
    }
    
    
    struct InfoShareReponse:Decodable {
        let alipay_user_info_share_response : InfoShareReponseInfo
        struct InfoShareReponseInfo :Decodable{
            let avatar:String
            let nick_name : String
            let gender :String
            let province:String
            let city:String
        }
    }
}

extension SocialLoginVC{
    private func signedParameters(_ parameters: [String:String]) -> [String:String]
    {
        
        var signedParameters = parameters;
        
       let urlparameters = parameters.map { "\($0)=\($1)"}.sorted().joined(separator: "&");
        guard let signer =  APRSASigner(privateKey: "支付宝创建的私钥"),let signedStr   = signer.sign(urlparameters, withRSA2: true) else {fatalError("sfsdfsdfds")};
        signedParameters["sign"] = signedStr.removingPercentEncoding ?? signedStr;
        return parameters;
        
        
    }
}
